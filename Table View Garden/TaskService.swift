import UIKit

protocol IService {
    func fetch(completion: (_ result: [String]) -> Void) -> Void
}

class TaskService: IService {
    
    func fetch(completion: (_ result: [String]) -> Void) -> Void {
        
        let url=URL(string:"https://jsonplaceholder.typicode.com/todos")
        do {
            
            let data = try Data(contentsOf: url!)
            
            if let items = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String: Any]] {
                
                var descriptions: [String] = []
                
                for index in 0...(items?.count)!-1 {
                    let item = items?[index] as! [String : AnyObject]
                    let title = item["title"] as! String
                    descriptions.append(title)
                }
                completion(descriptions)
            }
            
        }
        catch {
            
        }
    }
}
