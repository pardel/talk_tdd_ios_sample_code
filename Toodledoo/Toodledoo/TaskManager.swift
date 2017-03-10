//
//  TaskManager.swift
//  Toodledoo
//
//  Created by Paul Ardeleanu on 09/03/2017.
//  Copyright © 2017 Hello24. All rights reserved.
//

import Foundation

class TaskManager: DataSource {
    var numberOfActiveItems: Int {
        return tasks.filter{ !$0.wasCompleted }.count
    }
    var numberOfCompletedItems: Int {
        return tasksCompleted.count
    }

    
    var tasks: [Task] = []
    var tasksCompleted: [Task] { return tasks.filter { $0.wasCompleted } }
    
    func add(_ task: Task) {
        tasks.append(task)
    }
}
