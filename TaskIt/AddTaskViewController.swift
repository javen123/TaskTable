//
//  AddTaskViewController.swift
//  TaskIt
//
//  Created by Eliot Arntz on 9/22/14.
//  Copyright (c) 2014 BitFountain. All rights reserved.
//

import UIKit
import CoreData

protocol AddTaskViewControllerDelegate {
    func addTask(message: String)
    func addTaskCancelled(message: String)
}

class AddTaskViewController: UIViewController {
        
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subtaskTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    var delegate:AddTaskViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTapped(sender: UIButton) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        delegate?.addTaskCancelled("Task was not added")
        
    }
    
    @IBAction func addTaskButtonTapped(sender: UIButton) {
    
        let appDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        
        let managedObjectContext = ModelManager.instance.managedObjectContext
        let entityDescription = NSEntityDescription.entityForName("TaskModel", inManagedObjectContext: managedObjectContext!)
        let task = TaskModel(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext!)
        
        if NSUserDefaults.standardUserDefaults().boolForKey(kShouldCapitalizeTaskKey) == true {
            task.task = taskTextField.text.capitalizedString
        }
        else {
            task.task = taskTextField.text
        }
        
        if NSUserDefaults.standardUserDefaults().boolForKey(kShouldCompleteNewToDoKey) == true {
            task.completed = true
        }
        else {
            task.completed = false
        }
        
        task.subtask = subtaskTextField.text
        task.date = dueDatePicker.date
        
        
        ModelManager.instance.saveContext()
        
        var request = NSFetchRequest(entityName: "TaskModel")
        var error:NSError? = nil
        
        var results:NSArray = managedObjectContext!.executeFetchRequest(request, error: &error)!
        
        for res in results {
            println(res)
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
        delegate?.addTask("Task Added")

    }
    
    
    

}
