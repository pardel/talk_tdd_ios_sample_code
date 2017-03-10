//
//  DataManagerTests.swift
//  Toodledoo
//
//  Created by Paul Ardeleanu on 09/03/2017.
//  Copyright © 2017 Hello24. All rights reserved.
//

import XCTest
@testable import Toodledoo


class MockTaskManager: DataSource {
    var numberOfActiveItems: Int = 1
    var numberOfCompletedItems: Int = 2
}


class DataSourceTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    override func tearDown() {
        super.tearDown()
    }
    
    func testHasNumberOfActiveItems() {
        let taskManager = MockTaskManager()
        XCTAssertEqual(taskManager.numberOfActiveItems, 1)
    }
    func testHasNumberOfCompletedItems() {
        let taskManager = MockTaskManager()
        XCTAssertEqual(taskManager.numberOfCompletedItems, 2)
    }
}


class DataManagerTests: XCTestCase {
    
    var dataManager: DataManager!
    
    override func setUp() {
        super.setUp()
        let taskManager = MockTaskManager()
        dataManager = DataManager(dataSource: taskManager)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testConformsToTableDataSourceProtocol() {
        let _ = dataManager as UITableViewDataSource
    }
    
    func testHas2Sections() {
        XCTAssertEqual(dataManager.numberOfSections(in: UITableView()), 2)
    }
    
    func testConformsToTableDelegateProtocol() {
        let _ = dataManager as UITableViewDelegate
    }
    
    func testHasADataSource() {
        let _ = dataManager.dataSource
    }
    
    func testNumberOfRows() {
        XCTAssertEqual(dataManager.tableView(UITableView(), numberOfRowsInSection: 0), 1)
        XCTAssertEqual(dataManager.tableView(UITableView(), numberOfRowsInSection: 1), 2)
    }
    
}


class DataManagerAndTaskManagerIntegrationTests: XCTestCase {
    
    var dataManager: DataManager!
    var taskManager: TaskManager!
    
    override func setUp() {
        super.setUp()
        taskManager = TaskManager()
        dataManager = DataManager(dataSource: taskManager)
    }
    
    func testNumberOfActiveTasks() {
        XCTAssertEqual(dataManager.tableView(UITableView(), numberOfRowsInSection: 0), 0)
        let task = Task(name: UUID().uuidString)!
        taskManager.add(task)
        XCTAssertEqual(dataManager.tableView(UITableView(), numberOfRowsInSection: 0), 1)
        task.complete()
        XCTAssertEqual(dataManager.tableView(UITableView(), numberOfRowsInSection: 0), 0)
    }
    
    func testNumberOfCompletedTasks() {
        XCTAssertEqual(dataManager.tableView(UITableView(), numberOfRowsInSection: 1), 0)
        let task = Task(name: UUID().uuidString)!
        taskManager.add(task)
        XCTAssertEqual(dataManager.tableView(UITableView(), numberOfRowsInSection: 1), 0)
        task.complete()
        XCTAssertEqual(dataManager.tableView(UITableView(), numberOfRowsInSection: 1), 1)
    }
}
