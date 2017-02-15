//
//  ViewController.swift
//  Table View Garden
//
//  Created by pivotal on 2/14/17.
//  Copyright © 2017 pivotal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var taskTableView: UITableView?
    
    var taskListDataSource = TaskListDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let repository = TaskRepository(service: TaskService())
        
        repository.getAll() {
            (tasks: [Task]) in
            taskListDataSource.tasks = tasks
            taskTableView!.dataSource = taskListDataSource
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

