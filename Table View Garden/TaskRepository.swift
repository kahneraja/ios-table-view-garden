import UIKit

class TaskRepository {
    
    var service: IService
    
    init(service: IService) {
        self.service = service
    }

    func getAll(completion: (_ result: [Task]) -> Void) {
        
        let task = Task()
        task.title = "asdf"
        
        service.fetch() {
            (descriptions: [String]) in
            
            var tasks: [Task] = []
            
            for index in 0...(descriptions.count)-1 {
                let description = descriptions[index]
                let task = Task()
                task.title = description
                tasks.append(task)
            }
            
            let sorted = tasks.sorted {
                $0.title < $1.title
            }
            completion(sorted)
        }
    }
}
