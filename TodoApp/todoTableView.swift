
import UIKit

class todoTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var taskInput: UITextField!
    
    @IBAction func createTaskBtn(_ sender: Any) {
        if (taskInput.text != "") {
            taskInput.text = ""
            list.append(taskInput.text!)
            self.createTaskPopover.removeFromSuperview()
        }
    }
    @IBOutlet var createTaskPopover: UIView!
    
    @IBAction func showCreatePopover(_ sender: Any) {
        self.view.addSubview(createTaskPopover)
        createTaskPopover.center = self.view.center
    }
    
    
    var list = ["Run a mile", "Drink coffee", "Visit Grandma", "Read", "Code for 2 hours", "Watch podcast"]
    
    @IBOutlet weak var todoListTable: UITableView!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (list.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "todoCell")
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == UITableViewCell.EditingStyle.delete
        {
            self.list.remove(at: (indexPath.row))
            todoListTable.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        todoListTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        todoListTable.reloadData()
        
    }
    
    
}

