import UIKit

class EditViewController: UIViewController {

    var todoToEdit = ("", "", "", "", "", "", "", 1, 1, 1, 1, 1, 1, 1)
    
    @IBOutlet weak var forEdit: UILabel!
    
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
        
        expiringSoon.append(todoToEdit)
        print(expiringSoon)
        
    }
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //forEdit.text! = todoToEdit
         forEditText.text! = todoToEdit.0
        editTask.text! = todoToEdit.1
        editCategory.text! = todoToEdit.2
        editEffort.text! = todoToEdit.3
        editReward.text! = todoToEdit.4
        editEmotion.text! = todoToEdit.5
        editExpires.text! = todoToEdit.6
        
    }



}
