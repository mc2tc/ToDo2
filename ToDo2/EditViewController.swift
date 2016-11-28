import UIKit

class EditViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var todoToEdit = ("e", "", "", "", "", "", "", 1, 1, 1, 1, 1, 1, 1)
    
    @IBOutlet weak var forEditText: UITextField!
    @IBOutlet weak var editTask: UITextField!
    @IBOutlet weak var editCategory: UITextField!
    @IBOutlet weak var editEffort: UITextField!
    @IBOutlet weak var editReward: UITextField!
    @IBOutlet weak var editEmotion: UITextField!
    @IBOutlet weak var editExpires: UITextField!
    
    var picker6 = UIPickerView()
    var picker7 = UIPickerView()
    var picker8 = UIPickerView()
    var picker9 = UIPickerView()
    var picker10 = UIPickerView()
    var datePicker1 = UIDatePicker()

    
    
    
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
            let algorithm = SortAlgorithm()
            expiringSoon = algorithm.coke(A: expiringSoon)
        } else {
            notExpiringSoon.append(todoToEdit)
            let algorithm = SortAlgorithm()
            notExpiringSoon = algorithm.coke(A: notExpiringSoon)
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
        
        picker6.delegate = self; picker6.dataSource = self
        picker7.delegate = self; picker7.dataSource = self
        picker8.delegate = self; picker8.dataSource = self
        picker9.delegate = self; picker9.dataSource = self
        picker10.delegate = self; picker10.dataSource = self
        
        forEditText.inputView = picker6
        editCategory.inputView = picker7
        editEffort.inputView = picker8
        editReward.inputView = picker9
        editEmotion.inputView = picker10
        editExpires.inputView = datePicker1
        
        datePicker1.addTarget(self, action: #selector(datePickerChanged(sender:)), for: .valueChanged)
        datePicker1.datePickerMode = .date
        
        
    }
    
    func datePickerChanged(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        editExpires.text = formatter.string(from: sender.date)
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if forEditText.isFirstResponder {
            return PickerData.verb.count
        } else if editCategory.isFirstResponder {
            return PickerData.category.count
        } else if editEffort.isFirstResponder {
            return PickerData.effort.count
        } else if editReward.isFirstResponder {
            return PickerData.reward.count
        } else if editEmotion.isFirstResponder {
            return PickerData.emotion.count
        }
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if forEditText.isFirstResponder {
            forEditText.text = PickerData.verb[row]
        } else if editCategory.isFirstResponder {
            editCategory.text = PickerData.category[row]
        } else if editEffort.isFirstResponder {
            editEffort.text = PickerData.effort[row]
        } else if editReward.isFirstResponder {
            editReward.text = PickerData.reward[row]
        } else if editEmotion.isFirstResponder {
            editEmotion.text = PickerData.emotion[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if forEditText.isFirstResponder {
            return PickerData.verb[row]
        } else if editCategory.isFirstResponder {
            return PickerData.category[row]
        } else if editEffort.isFirstResponder {
            return PickerData.effort[row]
        } else if editReward.isFirstResponder {
            return PickerData.reward[row]
        } else if editEmotion.isFirstResponder {
            return PickerData.emotion[row]
        }
        return ""
        
    }



}
