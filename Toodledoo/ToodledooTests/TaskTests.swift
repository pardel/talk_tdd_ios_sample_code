//
//  TaskTests.swift
//  Toodledoo
//
//  Created by Paul Ardeleanu on 09/03/2017.
//  Copyright © 2017 Hello24. All rights reserved.
//

import XCTest
@testable import Toodledoo

class TaskTests: XCTestCase {
    
    var task: Task!
    
    override func setUp() {
        task = Task(name: UUID().uuidString)!
    }
    
    func testCanCreateATask() {
        _ = Task(name: UUID().uuidString)
    }
    
    func testTaskHasAName() {
        let taskName = UUID().uuidString
        let task = Task(name: taskName)
        XCTAssertEqual(task!.name, taskName)
    }
    
    func testTaskMustHaveAName() {
        let task = Task(name: "")
        XCTAssertNil(task)
    }
    
    func testTaskHasACompletionDate() {
        XCTAssertNil(task.completedAt)
    }
    
    func testTaskHasWasCompleted() {
        XCTAssertNil(task.completedAt)
        XCTAssertFalse(task.wasCompleted)
        task.completedAt = Date()
        XCTAssertTrue(task.wasCompleted, "wasCompleted must be true for a task with completion date")
    }
    
    func testCanCompleteATask() {
        XCTAssertFalse(task.wasCompleted)
        task.complete()
        XCTAssertTrue(task.wasCompleted)
    }
    func testCanReactivateATask() {
        task.complete()
        XCTAssertTrue(task.wasCompleted)
        task.reactivate()
        XCTAssertFalse(task.wasCompleted)
    }
    
}
