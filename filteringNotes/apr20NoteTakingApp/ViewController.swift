//
//  ViewController.swift
//  apr20NoteTakingApp
//
//  Created by Roxanne Farkas on 4/20/17.
//  Copyright © 2017 Roxanne Farkas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!

    var data:[String] = [""]
    var selectedRow: Int = -1
    var newRowText: String = ""
    var filePath: String?

    override func viewDidLoad() {
     super.viewDidLoad()

        self.title = "Notes"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target:self, action: #selector(addNote))
        self.navigationItem.rightBarButtonItem = addButton
        self.navigationItem.leftBarButtonItem = editButtonItem

        let docsDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .allDomainsMask, true)
        filePath = docsDir[0].appending("notes.txt")

        load()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if selectedRow == -1 {
            return
        }

        data[selectedRow] = newRowText

        if newRowText == "" {
            data.remove(at: selectedRow)
        }

        table.reloadData()
        save()
    }

    func addNote() {
        if (table.isEditing) {
            return
        }
        let name:String = ""
        data.insert(name, at: 0)
        let indexPath:IndexPath = IndexPath(row: 0, section: 0)
        table.insertRows(at: [indexPath], with: .automatic)
        table.selectRow(at: indexPath, animated: true, scrollPosition: .none)
        self.performSegue(withIdentifier: "detail", sender: nil)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }

    override func setEditing(_ editing: Bool, animated: Bool){
        super.setEditing(editing, animated: animated)
        table.setEditing(editing, animated: animated)

        if editing == false{
            save()
        }
    }

    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to toIndexPath: IndexPath) {
        let itemToMove = data[fromIndexPath.row]
        data.remove(at: fromIndexPath.row)
        data.insert(itemToMove, at: toIndexPath.row)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath:IndexPath){
        data.remove(at: indexPath.row)
        table.deleteRows(at: [indexPath], with: .fade)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detail", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailView:DetailViewController = segue.destination as! DetailViewController
        selectedRow = table.indexPathForSelectedRow! .row
        detailView.masterView = self
        detailView.setText(t: data[selectedRow])
    }

    func save(){
        guard let filePath = filePath else { return }
        let newData:NSArray = NSArray(array: data)
        newData.write(toFile: filePath, atomically: true)
    }

    func load(){
        guard let filePath = filePath else { return }
        if let loadedData = NSArray(contentsOfFile:filePath) as? [String] {
            data = loadedData
            table.reloadData()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

