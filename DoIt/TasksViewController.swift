//
//  ViewController.swift
//  DoIt
//
//  Created by Venkateswari Srinivasan on 13/03/17.
//  Copyright © 2017 Thoughtworks. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableview: UITableView!
    
    var tasks : [Task] = []
    
    var selectedIndex: Int? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        tasks = getAllTasks()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.important ? "🏉\(task.name)" : task.name
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        let selectedTask = tasks[selectedIndex!]
        performSegue(withIdentifier: "showTask", sender: selectedTask)
    }
    
    func getAllTasks() -> [Task] {
        return [Task(name: "Study IOS", important: false), Task(name: "Journalling", important: true),
                Task(name: "Sleep", important: false),Task(name: "Take Rest", important: false),Task(name: "Entertainment", important: true)]
    }
    
    @IBAction func onAddClick(_ sender: Any) {
        performSegue(withIdentifier: "addTask", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addTask" {
            let nextViewController = segue.destination as! TaskViewController
            nextViewController.previousViewController = self
        }
        if segue.identifier == "showTask" {
            let showVC = segue.destination as! ShowViewController
            showVC.task = sender as! Task
            showVC.previousVC = self
        }
    }
}

