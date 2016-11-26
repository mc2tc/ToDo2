import Foundation

class SortAlgorithm {

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
}
