//
//  TaskModel.swift
//  TaskIt
//
//  Created by user on 10/9/14.
//  Copyright (c) 2014 Neva. All rights reserved.
//

import Foundation
import CoreData

@objc(TaskModel)

class TaskModel: NSManagedObject {

    @NSManaged var completed: NSNumber
    @NSManaged var date: NSDate
    @NSManaged var subTask: String
    @NSManaged var task: String

}
