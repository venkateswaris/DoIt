//
//  ShowViewController.swift
//  DoIt
//
//  Created by Venkateswari Srinivasan on 15/03/17.
//  Copyright © 2017 Thoughtworks. All rights reserved.
//

import UIKit

class ShowViewController : UIViewController {
    
    var task: Task? = nil
    
    var previousVC = TasksViewController()

    @IBOutlet weak var taskLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let theTask = task {
            taskLabel.text = theTask.name
        }
    }
    
    @IBAction func onCompleteClicked(_ sender: Any) {
        if let theSelectedIndex = previousVC.selectedIndex {
            previousVC.tasks.remove(at: theSelectedIndex)
        }
        previousVC.tableview.reloadData()
        navigationController?.popViewController(animated: true)
        
    }
    
}
