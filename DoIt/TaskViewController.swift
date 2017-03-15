//
//  TaskViewController.swift
//  DoIt
//
//  Created by Venkateswari Srinivasan on 14/03/17.
//  Copyright © 2017 Thoughtworks. All rights reserved.
//

import UIKit

class TaskViewController : UIViewController {
    
    @IBOutlet weak var importantField: UISwitch!
    
    @IBOutlet weak var name: UITextField!
    
    var previousViewController = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addTask(_ sender: Any) {
        let task = Task(name: name.text!, important: importantField.isOn)
        previousViewController.tasks.append(task)
        previousViewController.tableview.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
}
