
import UIKit

var list = ["Run a mile", "Drink coffee", "Visit Grandma"]

class todoTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var list = ["Run a mile", "Drink coffee", "Visit Grandma"]
    
    @IBOutlet weak var todoListTable: UITableView!
    
    @available(iOS 2.0, *)
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
        
        
    }
    
    
}

