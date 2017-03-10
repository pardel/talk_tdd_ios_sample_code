//
//  TaskManagerTests.swift
//  Toodledoo
//
//  Created by Paul Ardeleanu on 09/03/2017.
//  Copyright © 2017 Hello24. All rights reserved.
//

import XCTest
@testable import Toodledoo

class TaskManagerTests: XCTestCase {
    
    var manager: TaskManager!
    
    func randomTask(name: String = UUID().uuidString) -> Task? {
        return Task(name: name)
    }
    
    override func setUp() {
        manager = TaskManager()
    }
    override func tearDown() {
        //print("❗️ finished test")
    }
    
    func testCanBeCreated() {
        XCTAssertNotNil(manager)
    }
    
    func testHasTasks() {
        XCTAssertNotNil(manager.tasks)
    }
    
    func testCanAddTask() {
        XCTAssertEqual(manager.tasks.count, 0)
        let task = randomTask()
        manager.add(task!)
        XCTAssertEqual(manager.tasks.count, 1)
        XCTAssertEqual(task!.name, manager.tasks.first!.name)
    }
    
    func testCompletedTasks() {
        manager.add(randomTask()!)
        manager.add(randomTask()!)
        XCTAssertEqual(manager.tasks.count, 2)
        XCTAssertEqual(manager.tasksCompleted.count, 0)
        manager.tasks.first!.complete()
        XCTAssertTrue(manager.tasks.first!.wasCompleted, "First task must be completed")
        XCTAssertEqual(manager.tasksCompleted.count, 1)
    }
    
}
