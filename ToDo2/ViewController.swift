import UIKit

var expiringSoon = [("", "", "", "", "", "", "",1,1,1,1,1,1,1)]
var notExpiringSoon = [("", "", "", "", "", "", "",1,1,1,1,1,1,1)]

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var todo1 = ("Schedule", "Something", "Personal", "Low", "Low", "Low", "11/16/17", 1, 1, 1, 1, 1, 1, 1)

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
        
        for i in 0...expiringSoon.count-1{
            for (j,k) in PickerData.verbDict {
                if j == expiringSoon[i].0 {
                    expiringSoon[i].7 = k
                }
            }
        }
        
        for i in 0...expiringSoon.count-1{
            for (j,k) in PickerData.emotionDict {
                if j == expiringSoon[i].5 {
                    expiringSoon[i].8 = k
                }
            }
        }
        
        for i in 0...expiringSoon.count-1{
            for (j,k) in PickerData.effortDict {
                if j == expiringSoon[i].3 {
                    expiringSoon[i].10 = k
                }
            }
        }
        
        for i in 0...expiringSoon.count-1{
            for (j,k) in PickerData.rewardDict {
                if j == expiringSoon[i].4 {
                    expiringSoon[i].11 = k
                }
            }
        }
        
        for i in 0...expiringSoon.count-1{
            for (j,k) in PickerData.rewardDict {
                if j == expiringSoon[i].2 {
                    expiringSoon[i].12 = k
                }
            }
        }
        
        for i in 0...expiringSoon.count-1{
            expiringSoon[i].13 = expiringSoon[i].10 * expiringSoon[i].11 * expiringSoon[i].12
        }
        
        expiringSoon = expiringSoon.sorted { ($1.7,$1.8,$1.13) > ($0.7,$0.8,$1.13) }
        
        
        
        
        for i in 0...notExpiringSoon.count-1{
            for (j,k) in PickerData.verbDict {
                if j == notExpiringSoon[i].0 {
                    notExpiringSoon[i].7 = k
                }
            }
        }
        
        for i in 0...notExpiringSoon.count-1{
            for (j,k) in PickerData.emotionDict {
                if j == notExpiringSoon[i].5 {
                    notExpiringSoon[i].8 = k
                }
            }
        }
        
        for i in 0...notExpiringSoon.count-1{
            for (j,k) in PickerData.effortDict {
                if j == notExpiringSoon[i].3 {
                    notExpiringSoon[i].10 = k
                }
            }
        }
        
        for i in 0...notExpiringSoon.count-1{
            for (j,k) in PickerData.rewardDict {
                if j == notExpiringSoon[i].4 {
                    notExpiringSoon[i].11 = k
                }
            }
        }
        
        for i in 0...notExpiringSoon.count-1{
            for (j,k) in PickerData.rewardDict {
                if j == notExpiringSoon[i].2 {
                    notExpiringSoon[i].12 = k
                }
            }
        }
        
        for i in 0...notExpiringSoon.count-1{
            notExpiringSoon[i].13 = notExpiringSoon[i].10 * notExpiringSoon[i].11 * notExpiringSoon[i].12
        }
        
        notExpiringSoon = notExpiringSoon.sorted { ($1.7,$1.8,$1.13) > ($0.7,$0.8,$1.13) }
        
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


}

