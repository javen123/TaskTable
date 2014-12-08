//
//  TaskDetailViewController.swift
//  TaskIt
//
//  Created by Eliot Arntz on 9/22/14.
//  Copyright (c) 2014 BitFountain. All rights reserved.
//

import UIKit

@objc protocol TaskDetailViewControllerDelegate {
    optional func taskDetailEdited()
}

class TaskDetailViewController: UIViewController {

    var detailTaskModel: TaskModel!
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subtaskTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var addTask: UIBarButtonItem!
    
    var cancelImage = UIImage(named: "CancelButton")
    var addTaskImage = UIImage(named: "AddTaskButton")
    
    var delegate:TaskDetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        
        cancelButton.setBackButtonBackgroundImage(cancelImage, forState: UIControlState.Normal, barMetrics: UIBarMetrics.Default)
        addTask.setBackButtonBackgroundImage(addTaskImage, forState: UIControlState.Normal, barMetrics: UIBarMetrics.Default)
                
        self.taskTextField.text = detailTaskModel.task
        self.subtaskTextField.text = detailTaskModel.subtask
        self.dueDatePicker.date = detailTaskModel.date
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTapped(sender: UIBarButtonItem) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func doneBarButtonItemPressed(sender: UIBarButtonItem) {
        
        let appDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        
        detailTaskModel.task = taskTextField.text
        detailTaskModel.subtask = subtaskTextField.text
        detailTaskModel.date = dueDatePicker.date
        detailTaskModel.completed = detailTaskModel.completed
        
        ModelManager.instance.saveContext()
        
        self.navigationController?.popViewControllerAnimated(true)
        delegate?.taskDetailEdited!()
    }
    
    
    
    

}
