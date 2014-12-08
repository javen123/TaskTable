//
//  TaskDetailController.swift
//  TaskIt
//
//  Created by user on 10/8/14.
//  Copyright (c) 2014 Neva. All rights reserved.
//

import UIKit

class TaskDetailController: UIViewController {
    
   
    
    @IBOutlet weak var subTaskTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var taskTextField: UITextField!
    
    var detailTaskModel: TaskModel!
       
    
    override func viewDidLoad() {
        super.viewDidLoad()

       taskTextField.text = detailTaskModel.task
       subTaskTextField.text = detailTaskModel.subTask
       datePicker.date = detailTaskModel.date
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTapped(sender: UIBarButtonItem) {
        
        navigationController?.popViewControllerAnimated(true)
    }

    @IBAction func doneBarButtonTapped(sender: UIBarButtonItem) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        detailTaskModel.task = taskTextField.text
        detailTaskModel.subTask = taskTextField.text
        detailTaskModel.date = datePicker.date
        detailTaskModel.completed = detailTaskModel.completed
        
        appDelegate.saveContext()
        
        self.navigationController?.popViewControllerAnimated(true)
    }
}
