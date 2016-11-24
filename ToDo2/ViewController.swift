import UIKit

var expiringSoon = [("", "", "", "", "", "", "",1,1,1,1,1,1,1)]
var notExpiringSoon = [("", "", "", "", "", "", "",1,1,1,1,1,1,1)]

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var todo1 = ("", "", "", "", "", "", "", 1, 1, 1, 1, 1, 1, 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        if todo1.9 == 1 {
            expiringSoon.append(todo1)
        } else {
            notExpiringSoon.append(todo1)
        }
        
        expiringSoon = coke(A: expiringSoon)
        
        notExpiringSoon = coke(A: notExpiringSoon)
        
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
            let c = expiringSoon[indexPath.row]
            //expiringSoon.remove(at: indexPath.row)
            self.performSegue(withIdentifier: "editing", sender: indexPath)
            
        } else {
            let d = notExpiringSoon[indexPath.row]

            //notExpiringSoon.remove(at: indexPath.row)
            self.performSegue(withIdentifier: "editing1", sender: indexPath)

        }
        
    }
    
    //---
    func coke(A: [(String,String,String,String,String,String,String,Int,Int,Int,Int,Int,Int,Int)]) -> [(String,String,String,String,String,String,String,Int,Int,Int,Int,Int,Int,Int)] {
        
        var B = A
        
        for i in 0...B.count-1{
            for (j,k) in PickerData.verbDict {
                if j == B[i].0 {
                    B[i].7 = k
                }
            }
        }
        
        for i in 0...B.count-1{
            for (j,k) in PickerData.emotionDict {
                if j == B[i].5 {
                    B[i].8 = k
                }
            }
        }
        
        for i in 0...B.count-1{
            for (j,k) in PickerData.effortDict {
                if j == B[i].3 {
                    B[i].10 = k
                }
            }
        }
        
        for i in 0...B.count-1{
            for (j,k) in PickerData.rewardDict {
                if j == B[i].4 {
                    B[i].11 = k
                }
            }
        }
        
        for i in 0...B.count-1{
            for (j,k) in PickerData.rewardDict {
                if j == B[i].2 {
                    B[i].12 = k
                }
            }
        }
        
        for i in 0...B.count-1{
            B[i].13 = B[i].10 * B[i].11 * B[i].12
        }
        
        return B.sorted { ($1.7,$1.8,$1.13) > ($0.7,$0.8,$1.13) }
        
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
    
    

}

