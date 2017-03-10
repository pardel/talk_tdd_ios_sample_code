//: Playground - noun: a place where people can play

import XCTest

class Task {
    var name: String
    var completedAt: Date?
    
    init?(name: String) {
        if name.characters.count == 0 {
            return nil
        }
        self.name = name
    }
    
    var wasCompleted: Bool {
        return nil != completedAt
    }
    
    func complete() {
        completedAt = Date()
    }
    func reactivate() {
        completedAt = nil
    }
}



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

TaskTests.defaultTestSuite().run()



//: ---
class TaskManager {
    var tasks: [Task] = []
    var tasksCompleted: [Task] { return tasks.filter { $0.wasCompleted } }
    
    func add(_ task: Task) {
        //tasks.append(Task(name: UUID().uuidString)!)
        tasks.append(task)
    }
}

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

TaskManagerTests.defaultTestSuite().run()

