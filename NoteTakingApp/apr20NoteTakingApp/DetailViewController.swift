//
//  DetailViewController.swift
//  apr20NoteTakingApp
//
//  Created by Roxanne Farkas on 4/24/17.
//  Copyright © 2017 Roxanne Farkas. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    var text: String = ""
    var masterView:ViewController!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = text
    }

    func setText(t:String) {
        text = t
        if isViewLoaded {
            textView.text = t
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        masterView.newRowText = textView.text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
