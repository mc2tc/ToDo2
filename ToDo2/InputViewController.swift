import UIKit

class InputViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate {

    @IBOutlet weak var verbText: UITextField!
    @IBOutlet weak var taskText: UITextField!
    @IBOutlet weak var categoryText: UITextField!
    @IBOutlet weak var effortText: UITextField!
    @IBOutlet weak var rewardText: UITextField!
    @IBOutlet weak var emotionText: UITextField!
    @IBOutlet weak var expiresText: UITextField!
    
    var picker1 = UIPickerView()
    var picker2 = UIPickerView()
    var picker3 = UIPickerView()
    var picker4 = UIPickerView()
    var picker5 = UIPickerView()
    var datePicker = UIDatePicker()
    
    var todo  = ("dummy", "dummy", "dummy", "dummy", "dummy", "dummy", "01/01/17", 1, 1, 1,1,1,1,1)
    
    
    @IBAction func buildTodo(_ sender: UIButton) {
        
        todo.0 = verbText.text!
        todo.1 = taskText.text!
        todo.2 = categoryText.text!
        todo.3 = effortText.text!
        todo.4 = rewardText.text!
        todo.5 = emotionText.text!
        todo.6 = expiresText.text!
        todo.7 = 1
        todo.8 = 1
        todo.9 = 1
        
//        todoLabel.text = verbText.text! + " " + taskText.text! + " in category " + categoryText.text! + " requiring " + effortText.text! + " effort and with " + rewardText.text! + " reward " + emotionText.text! + expiresText.text!
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy"
        _ = NSCalendar.current
        
        let dateNow = Date()
        var startDate = dateFormatter.date(from: "01/02/17")
        
        startDate = dateFormatter.date(from: todo.6)
        print(todo.6)
        let days: Int = daysBetween(start: dateNow, end: startDate!)
        print("days is \(days)")
        if  days <= 3 {
            todo.9 = 1
        } else {
            todo.9 = 0
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker1.delegate = self; picker1.dataSource = self
        picker2.delegate = self; picker2.dataSource = self
        picker3.delegate = self; picker3.dataSource = self
        picker4.delegate = self; picker4.dataSource = self
        picker5.delegate = self; picker5.dataSource = self
        
        verbText.inputView = picker1
        categoryText.inputView = picker2
        effortText.inputView = picker3
        rewardText.inputView = picker4
        emotionText.inputView = picker5
        expiresText.inputView = datePicker
        
        datePicker.addTarget(self, action: #selector(datePickerChanged(sender:)), for: .valueChanged)
        datePicker.datePickerMode = .date
        
        taskText.layer.cornerRadius = 5
        taskText.layer.borderColor = UIColor.lightGray.cgColor
        taskText.layer.borderWidth = 0.5

        
    }
    
    func daysBetween(start: Date, end: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: start, to: end).day!
    }
    
    
    func datePickerChanged(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        expiresText.text = formatter.string(from: sender.date)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if verbText.isFirstResponder {
            return PickerData.verb.count
        } else if categoryText.isFirstResponder {
            return PickerData.category.count
        } else if effortText.isFirstResponder {
            return PickerData.effort.count
        } else if rewardText.isFirstResponder {
            return PickerData.reward.count
        } else if emotionText.isFirstResponder {
            return PickerData.emotion.count
        }
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if verbText.isFirstResponder {
            verbText.text = PickerData.verb[row]
        } else if categoryText.isFirstResponder {
            categoryText.text = PickerData.category[row]
        } else if effortText.isFirstResponder {
            effortText.text = PickerData.effort[row]
        } else if rewardText.isFirstResponder {
            rewardText.text = PickerData.reward[row]
        } else if emotionText.isFirstResponder {
            emotionText.text = PickerData.emotion[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if verbText.isFirstResponder {
            return PickerData.verb[row]
        } else if categoryText.isFirstResponder {
            return PickerData.category[row]
        } else if effortText.isFirstResponder {
            return PickerData.effort[row]
        } else if rewardText.isFirstResponder {
            return PickerData.reward[row]
        } else if emotionText.isFirstResponder {
            return PickerData.emotion[row]
        }
        return ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tableVC: ViewController = segue.destination as! ViewController
        
        //tableVC.todos1 = ListOfTodos.todos
        tableVC.todo1 = todo
        print(todo)
    }

    
}
