import UIKit

class PickerData: NSObject {

    // Add pickerData here... (for now at least)
    static var verbDict: [String:Int] = ["Schedule":1, "Invite":1, "Book":1, "Pay":1, "Decide On":2, "Negotiate":2, "Review":3, "Prepare":3, "Analyze":3, "Think about":3]
    static var categoryDict: [String:Int] = ["Strategic":10,"Stakeholder":9, "Talent":8, "Problem/Market":7, "Solution/Product":6, "Partnerships":5, "Finance":4, "Legal and Admin":3]
    static var effortDict: [String:Int] = ["High":3, "Medium":2,"Low":1]
    static var rewardDict: [String:Int] = ["High":1, "Medium":2,"Low":3]
    static var emotionDict: [String:Int] = ["High":3, "Medium":2,"Low":1]
    
    //static var verb = [String](verbDict.keys)
    //static var category = [String](categoryDict.keys)
    // Have to solve the problem of order
    static var verb: [String] = ["Schedule", "Invite", "Book", "Pay", "Decide On", "Negotiate", "Review", "Prepare", "Analyze", "Think about"]
    static var category: [String] = ["Personal","Strategic","Stakeholder", "Talent", "Problem/Market", "Solution/Product", "Partnerships", "Finance", "Legal and Admin"]
    static var effort = [String](effortDict.keys)
    static var reward = [String](rewardDict.keys)
    static var emotion = [String](emotionDict.keys)
    
}
