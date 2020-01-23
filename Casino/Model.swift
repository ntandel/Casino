
// Assignment 1 SlotMachine
// Date : 22nd jan 2020
// Description :  Creating SlotMachine by parsing jQuery to Swift.
// Version history : 2.0
// Vishal Chanchlani (301090878)
// Vedvrat Singh Parihar (301089005)
// Nisha Tandel (301094688)

import UIKit
import AVFoundation
class Model{
    
    fileprivate static let modelInstance = Model()
    
    fileprivate init() {}
    
    static var instance : Model{
        get{
            return modelInstance
        }
    }
    
    var player : AVAudioPlayer?
    
    // update user score
    func updateScore(label : UILabel,cash amount : Int){
        label.text = "\(Int(amount))$"
        UserDefaults.standard.set(amount, forKey: Constant.user_cash)
    }
    
    // get last saved score
    func getScore() -> Int{
        let cash = UserDefaults.standard.integer(forKey: Constant.user_cash)
        return cash <= 0 ? 1000 : cash
    }
    
    // check if it's first time playing
    func isFirstTime() -> Bool{
        let saveExist = UserDefaults.standard.bool(forKey: Constant.is_save_exist)
        if !saveExist{
            UserDefaults.standard.set(true, forKey: Constant.is_save_exist)
            return true
        }
        return false
    }
    
    // play sound
    func play(sound name : String){
        guard let url = Bundle.main.url(forResource: name, withExtension: "wav") else{
            return
        }
        player = try? AVAudioPlayer(contentsOf: url)
        player?.play()
    }
    
    
    
}
