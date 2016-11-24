import UIKit

class EditViewController: UIViewController {

    var todoToEdit = ("", "", "", "", "", "", "", 1, 1, 1, 1, 1, 1, 1)
    
    
    @IBOutlet weak var forEditText: UITextField!
    @IBOutlet weak var editTask: UITextField!
    @IBOutlet weak var editCategory: UITextField!
    
    @IBOutlet weak var editEffort: UITextField!
    @IBOutlet weak var editReward: UITextField!
    @IBOutlet weak var editEmotion: UITextField!
    @IBOutlet weak var editExpires: UITextField!
    
    
    @IBAction func editButton(_ sender: UIButton) {
        todoToEdit.0 = forEditText.text!
        todoToEdit.1 = editTask.text!
        todoToEdit.2 = editCategory.text!
        todoToEdit.3 = editEffort.text!
        todoToEdit.4 = editReward.text!
        todoToEdit.5 = editEmotion.text!
        todoToEdit.6 = editExpires.text!
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy"
        _ = NSCalendar.current
        
        let dateNow = Date()
        var startDate = dateFormatter.date(from: "01/02/17")
        
        startDate = dateFormatter.date(from: todoToEdit.6)
        let ivc = InputViewController()
        let days: Int = ivc.daysBetween(start: dateNow, end: startDate!)
        if  days <= 3 {
            todoToEdit.9 = 1
        } else {
            todoToEdit.9 = 0
        }
        
        if todoToEdit.9 == 1 {
            expiringSoon.append(todoToEdit)
            let vc = ViewController()
            expiringSoon = vc.coke(A: expiringSoon)
        } else {
            notExpiringSoon.append(todoToEdit)
            let vc = ViewController()
            notExpiringSoon = vc.coke(A: notExpiringSoon)
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        forEditText.text! = todoToEdit.0
        editTask.text! = todoToEdit.1
        editCategory.text! = todoToEdit.2
        editEffort.text! = todoToEdit.3
        editReward.text! = todoToEdit.4
        editEmotion.text! = todoToEdit.5
        editExpires.text! = todoToEdit.6
        
    }

}
