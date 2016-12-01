import UIKit
import CoreData

var expiringSoon = [("initialize", "", "", "", "", "", "",1,1,1,1,1,1,1)]
var notExpiringSoon = [("initialize", "", "", "", "", "", "",1,1,1,1,1,1,1)]
var expiringSoonAlias = [("initialize_alias", "", "", "", "", "", "",1,1,1,1,1,1,1)]
var counter = 0

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let moc = DataController().managedObjectContext
   
    var todo1 = ("initialize", "", "", "", "", "", "", 1, 1, 1, 1, 1, 1, 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        if counter == 0 {
            fetch()
            expiringSoon = expiringSoonAlias
            expiringSoonAlias = [("initialize_alias", "", "", "", "", "", "",1,1,1,1,1,1,1)]
        }
        
        counter = counter + 1
        
        if todo1.9 == 1 {
            expiringSoon.append(todo1)
            
            let algorithm1 = SortAlgorithm()
            
            if expiringSoon.count > 0 {
                expiringSoon = algorithm1.coke(A: expiringSoon)
                expiringSoon = expiringSoon.filter({$0.0 != "initialize"})
            }
            if counter > 1 {
                saveTodo()
            }
        }
        
        if todo1.9 == 0 {
            notExpiringSoon.append(todo1)
            let algorithm2 = SortAlgorithm()
            if notExpiringSoon.count > 0 {
                notExpiringSoon = algorithm2.coke(A: notExpiringSoon)
                notExpiringSoon = notExpiringSoon.filter({$0.0 != "initialize"})
            }
        }
    
    }
    
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.tableView.setEditing(editing, animated: animated)
    
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return expiringSoon.count
        } else {
            return notExpiringSoon.count
        }
    
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if indexPath.section == 0 {
            let a = expiringSoon[indexPath.row]
            cell.textLabel?.text = a.0 + " " + a.1
            
        } else {
            let b = notExpiringSoon[indexPath.row]
            cell.textLabel?.text = b.0 + " " + b.1
        }
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
        
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if indexPath.section == 0 {
                expiringSoon.remove(at: indexPath.row)
            } else {
                notExpiringSoon.remove(at: indexPath.row)
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }
    }
    
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section==0 {
            return "Expiring Soon"
        } else {
            return "Other"
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            _ = expiringSoon[indexPath.row]
            self.performSegue(withIdentifier: "editing", sender: indexPath)
        } else {
            _ = notExpiringSoon[indexPath.row]
            self.performSegue(withIdentifier: "editing1", sender: indexPath)
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "editing" || segue.identifier == "editing1") {
            if (segue.identifier == "editing") {
                let editVC: EditViewController = segue.destination as! EditViewController
                let row = (sender as! NSIndexPath).row
                editVC.todoToEdit = expiringSoon[row]
                expiringSoon.remove(at: row)
            } else if (segue.identifier == "editing1") {
                let editVC: EditViewController = segue.destination as! EditViewController
                let row = (sender as! NSIndexPath).row
                editVC.todoToEdit = notExpiringSoon[row]
                notExpiringSoon.remove(at: row)
                
            }
        }
    }
    
    
    func fetch() {
        
        let todoFetch = NSFetchRequest<NSFetchRequestResult>(entityName:"SavedToDo")
        
        do {
            let fetchedTodo = try moc.fetch(todoFetch) as! [SavedToDo]
            
            let addOne = ("initialize_alias+1", "", "", "", "", "", "",1,1,1,1,1,1,1)
            
            if fetchedTodo.count > 0 {
                
                for i in 0...fetchedTodo.count-1{
                    expiringSoonAlias.append(addOne)
                }
                
                for i in 0...(fetchedTodo.count-1) {
                    expiringSoonAlias[i].0 = fetchedTodo[i].verb!
                    expiringSoonAlias[i].1 = fetchedTodo[i].task!
                    expiringSoonAlias[i].2 = fetchedTodo[i].category!
                    expiringSoonAlias[i].3 = fetchedTodo[i].effort!
                    expiringSoonAlias[i].4 = fetchedTodo[i].reward!
                    expiringSoonAlias[i].5 = fetchedTodo[i].emotion!
                    expiringSoonAlias[i].6 = fetchedTodo[i].expires!
                    expiringSoonAlias[i].7 = fetchedTodo[i].verbNum
                    expiringSoonAlias[i].8 = fetchedTodo[i].emotionNum
                    expiringSoonAlias[i].9 = fetchedTodo[i].expiresNum
                    expiringSoonAlias[i].10 = fetchedTodo[i].effortNum
                    expiringSoonAlias[i].11 = fetchedTodo[i].rewardNum
                    expiringSoonAlias[i].12 = fetchedTodo[i].categoryNum
                    expiringSoonAlias[i].13 = fetchedTodo[i].sortNum
                }
            }
            
        } catch {
            fatalError("bad things happened \(error)")
        }
        
    }
    
    
    func saveTodo() {
        
        let entity = NSEntityDescription.insertNewObject(forEntityName: "SavedToDo", into: moc) as! SavedToDo
        
            entity.setValue(todo1.0, forKey: "verb")
            entity.setValue(todo1.1, forKey: "task")
            entity.setValue(todo1.2, forKey: "category")
            entity.setValue(todo1.3, forKey: "effort")
            entity.setValue(todo1.4, forKey: "reward")
            entity.setValue(todo1.5, forKey: "emotion")
            entity.setValue(todo1.6, forKey: "expires")
            entity.setValue(todo1.7, forKey: "verbNum")
            entity.setValue(todo1.8, forKey: "emotionNum")
            entity.setValue(todo1.9, forKey: "expiresNum")
            entity.setValue(todo1.10, forKey: "effortNum")
            entity.setValue(todo1.11, forKey: "rewardNum")
            entity.setValue(todo1.12, forKey: "categoryNum")
            entity.setValue(todo1.13, forKey: "sortNum")
        
        do {
            try moc.save()
        } catch {
            fatalError("failure to save context: \(error)")
        }
    }
}

