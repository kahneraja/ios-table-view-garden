import UIKit

class TaskListDataSource: NSObject, UITableViewDataSource {

    // get data from
    var tasks: [Task] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        let task = tasks[indexPath.row]
        cell.textLabel!.text = task.title
        return cell
    }
    

}
