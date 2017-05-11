//
//  ViewController.swift
//  apr20NoteTakingApp
//
//  Created by Roxanne Farkas on 4/20/17.
//  Copyright © 2017 Roxanne Farkas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchResultsUpdating {

    
    @IBOutlet weak var table: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)

    var data:[Note] = []
    var filteredData:[Note] = []
    var selectedRow: Int = -1
    var newRowText: String = ""
    var filePath: String?

    override func viewDidLoad() {
     super.viewDidLoad()

        setupSearchVC()
        self.title = "To Do List"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target:self, action: #selector(addNote))
        self.navigationItem.rightBarButtonItem = addButton
        self.navigationItem.leftBarButtonItem = editButtonItem

        let docsDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .allDomainsMask, true)
        filePath = docsDir[0].appending("notes.txt")

        load()
    }
    
    func setupSearchVC()
    {
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        definesPresentationContext = true
        table.tableHeaderView = searchController.searchBar
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All")
    {

        let searchValueIsEmpty = searchText == ""

        guard !searchValueIsEmpty else {
            filteredData = data
            table.reloadData()
            return
        }

        filteredData = data.filter {note  in
            return note.title.lowercased().contains(searchText.lowercased())
        }
        table.reloadData()
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if selectedRow == -1 {
            return
        }

        data[selectedRow].title = newRowText

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
        let newNote:Note = Note(title: "")
        data.insert(newNote, at: 0)
        filteredData = data
        let indexPath:IndexPath = IndexPath(row: 0, section: 0)
        table.insertRows(at: [indexPath], with: .automatic)
        table.selectRow(at: indexPath, animated: true, scrollPosition: .none)
        self.performSegue(withIdentifier: "detail", sender: nil)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let note = filteredData[indexPath.row]
        cell.textLabel?.text = note.title
        if note.complete {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
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
        filteredData = data
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath:IndexPath){
        data.remove(at: indexPath.row)
        filteredData = data
        table.deleteRows(at: [indexPath], with: .fade)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detail", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailView:DetailViewController = segue.destination as! DetailViewController
        selectedRow = table.indexPathForSelectedRow! .row
        detailView.masterView = self
        detailView.note = data[selectedRow]
    }

    func save(){
        guard let filePath = filePath else { return }
        let newData:NSArray = NSArray(array: data)
        newData.write(toFile: filePath, atomically: true)
    }

    func load(){
        guard let filePath = filePath else { return }
        if let loadedData = NSArray(contentsOfFile:filePath) as? [String] {

            var listOfNotes: [Note] = []

            for title in loadedData {
                let newNote:Note = Note(title: title)
                listOfNotes.append(newNote)

            }

            data = listOfNotes

            filteredData = data
            table.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

     //     MARK: - Search bar Delegate
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int)
    {
        print("*searchBar - ")
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }

    // MARK: - Search View Controller Delegate
    //method is automatically called whenever the search bar becomes the first responder or changes are made to the text in the search bar. Perform any required filtering and updating inside of this method.
    public func updateSearchResults(for searchController: UISearchController)
    {

        let searchBar = searchController.searchBar
        print("*updateSearchResults - \(searchBar.text)")
//        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!)
    }

}

