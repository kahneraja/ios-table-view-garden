import XCTest
@testable import Table_View_Garden

class FakeTaskService: IService {
    func fetch(completion: (_ result: [String]) -> Void) -> Void {
        var tasks: [String] = []
        tasks.append("A")
        tasks.append("D")
        tasks.append("C")
        tasks.append("B")
        completion(tasks)
    }
}

class TaskRepositoryTests: XCTestCase {
    
    var repo = TaskRepository(service:FakeTaskService())
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func whenFetch_ReturnsAllRecords() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        repo.getAll() {
            (tasks: [Task]) in
            XCTAssertTrue(tasks.count == 3)
        }
    }
    
    func whenFetch_SortsByTitle() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        repo.getAll() {
            (tasks: [Task]) in
            XCTAssertTrue(tasks[0].title == "A")
            XCTAssertTrue(tasks[1].title == "B")
            XCTAssertTrue(tasks[2].title == "C")
            XCTAssertTrue(tasks[3].title == "D")
        }
    }
    
}
