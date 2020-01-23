// Assignment 1 SlotMachine
// Date : 22nd jan 2020
// Description :  Creating SlotMachine by parsing jQuery to Swift.
// Version history : 2.0
// Vishal Chanchlani (301090878)
// Vedvrat Singh Parihar (301089005)
// Nisha Tandel (301094688)


import UIKit
import AVFoundation

class ViewController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate{
    
    let images = [#imageLiteral(resourceName: "orange"),#imageLiteral(resourceName: "bell"),#imageLiteral(resourceName: "banana"),#imageLiteral(resourceName: "seven"),#imageLiteral(resourceName: "cherry"),#imageLiteral(resourceName: "Bar"),#imageLiteral(resourceName: "blank")]
    
    @IBOutlet weak var machineImageView: UIImageView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var barImageView: UIImageView!
    @IBOutlet weak var userIndicatorlabel: UILabel!
    @IBOutlet weak var cashImageView: UIImageView!
    @IBOutlet weak var cashToRiskLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    // variables used
    var spinResult: [String] = [""];
       var fruits = "";
       var grape = 0;
       var banana = 0;
       var orange = 0;
       var cherry = 0;
       var Bar = 0;
       var bell = 0;
       var seven = 0;
       var blanks = 0;
    
    
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        stepper.maximumValue = Double(currentCash)
        let amount = Int(sender.value)
        if currentCash >= amount{
            cashToRisk = amount
            cashToRiskLabel.text = "\(amount)$"
        }
    }
    // display cash lable
    @IBOutlet weak var cashLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startGame()
        
        // swipeDown GestureRecognizer
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    // Bet amount
    var cashToRisk : Int = 10{
        didSet{//update ui
            cashToRiskLabel.text = "\(currentCash)$"
        }
    }
    
    // get current displayed cash, remove '$'
    var currentCash : Int{
        guard let cash = cashLabel.text, !(cashLabel.text?.isEmpty)! else {
            return 0
        }
        return Int(cash.replacingOccurrences(of: "$", with: ""))!
    }
    
    func startGame(){
        if Model.instance.isFirstTime(){ // check if it's first time playing
            Model.instance.updateScore(label: cashLabel, cash: 1000)
        }else{ // get last saved score
            cashLabel.text = "\(Model.instance.getScore())$"
        } // set max bet
        stepper.maximumValue = Double(currentCash)
    }
    
    func roll(){ // roll pickerview
        var delay : TimeInterval = 0
        // iterate over each component, set random img
        for i in 0..<pickerView.numberOfComponents{
            DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                self.randomSelectRow(in: i)
            })
            delay += 0.30
        }
    }
    
    // get random number
    func randomSelectRow(in comp : Int){
        let r = Int(arc4random_uniform(UInt32(8 * images.count))) + images.count
        pickerView.selectRow(r, inComponent: comp, animated: true)
        
    }
    
    
    //MARK: -  Winning Possibilities
    
    /* Utility function to reset all fruit tallies */
      public func resetFruitTally() {
          grape = 0;
          banana = 0;
          orange = 0;
          cherry = 0;
          Bar = 0;
          bell = 0;
          seven = 0;
          blanks = 0;
      }
      
      
      public func determineWinnings() {

          
             if (blanks == 0)
             {
                 if (grape == 3) {
                 userIndicatorlabel.text = "YOU WON \(cashToRisk * 10)$"
                    Model.instance.play(sound: Constant.winning_sound)
                                            animate(view: machineImageView, images: [#imageLiteral(resourceName: "machine"),#imageLiteral(resourceName: "machine_off")], duration: 1, repeatCount: 15)
                                
                 }
                 else if(banana == 3) {
                 userIndicatorlabel.text = "YOU WON \(cashToRisk * 20)$"
                 Model.instance.play(sound: Constant.winning_sound)
                                         animate(view: machineImageView, images: [#imageLiteral(resourceName: "machine"),#imageLiteral(resourceName: "machine_off")], duration: 1, repeatCount: 15)
                              
                 }
                 else if (orange == 3) {
                     userIndicatorlabel.text = "YOU WON \(cashToRisk * 30)$"
                    Model.instance.play(sound: Constant.winning_sound)
                                            animate(view: machineImageView, images: [#imageLiteral(resourceName: "machine"),#imageLiteral(resourceName: "machine_off")], duration: 1, repeatCount: 15)
                                 
                 }
                 else if (cherry == 3) {
                     userIndicatorlabel.text = "YOU WON \(cashToRisk * 40)$"
                    Model.instance.play(sound: Constant.winning_sound)
                                            animate(view: machineImageView, images: [#imageLiteral(resourceName: "machine"),#imageLiteral(resourceName: "machine_off")], duration: 1, repeatCount: 15)
                                 
                 }
                 else if (Bar == 3) {
                     userIndicatorlabel.text = "YOU WON \(cashToRisk * 50)$"
                    Model.instance.play(sound: Constant.winning_sound)
                                            animate(view: machineImageView, images: [#imageLiteral(resourceName: "machine"),#imageLiteral(resourceName: "machine_off")], duration: 1, repeatCount: 15)
                                 
                 }
                 else if (bell == 3) {
                     userIndicatorlabel.text = "YOU WON \(cashToRisk * 75)$"
                    Model.instance.play(sound: Constant.winning_sound)
                                            animate(view: machineImageView, images: [#imageLiteral(resourceName: "machine"),#imageLiteral(resourceName: "machine_off")], duration: 1, repeatCount: 15)
                                 
                 }
                 else if (seven == 3) {
                     userIndicatorlabel.text = "YOU WON \(cashToRisk * 100)$"
                    Model.instance.play(sound: Constant.winning_sound)
                                            animate(view: machineImageView, images: [#imageLiteral(resourceName: "machine"),#imageLiteral(resourceName: "machine_off")], duration: 1, repeatCount: 15)
                                 
                 }
                 else if (grape == 2) {
                     //userIndicatorlabel.text = "YOU WON \(cashToRisk * 2)$"
                    userIndicatorlabel.text = "Won Something"
                 }
                 else if (banana == 2) {
                     //userIndicatorlabel.text = "YOU WON \(cashToRisk * 2)$"
                     userIndicatorlabel.text = "Won Something"
                 }
                 else if (orange == 2) {
                    //userIndicatorlabel.text = "YOU WON \(cashToRisk * 3)$"
                     userIndicatorlabel.text = "Won Something"
                 }
                 else if (cherry == 2) {
                     //userIndicatorlabel.text = "YOU WON \(cashToRisk * 4)$"
                     userIndicatorlabel.text = "Won Something"
                 }
                 else if (Bar == 2) {
                     //userIndicatorlabel.text = "YOU WON \(cashToRisk * 5)$"
                     userIndicatorlabel.text = "Won Something"
                 }
                 else if (bell == 2) {
                     //userIndicatorlabel.text = "YOU WON \(cashToRisk * 10)$"
                     userIndicatorlabel.text = "Won Something"
                 }
                 else if (seven == 2) {
                    //userIndicatorlabel.text = "YOU WON \(cashToRisk * 20)$"
                     userIndicatorlabel.text = "Won Something"
                 }
                 else if (seven == 1) {
                     //userIndicatorlabel.text = "YOU WON \(cashToRisk * 5)$"
                     userIndicatorlabel.text = "Won Something"
                 }
                 else {
                     // losing
                    userIndicatorlabel.text = "TRY AGAIN"
                     Model.instance.updateScore(label: cashLabel,cash: (currentCash - cashToRisk))
                        
                 }
                 
              stepper.maximumValue = Double(currentCash)
                 
             }
             else
             {
                 // losing
                 userIndicatorlabel.text = "TRY AGAIN"
              Model.instance.updateScore(label: cashLabel,cash: (currentCash - cashToRisk))
                 
             }
         }
    
    
    
    /* Utility function to check if a value falls within a range of bounds */
       public func checkRange(value:Int, lowerBounds:Int, upperBounds:Int) ->Int{
           if (value >= lowerBounds && value <= upperBounds)
           {
               return value;
           }
           else {
               return 0;
           }
       }
    
    func checkWin()-> Array<String> {
               var betLine = [" ", " ", " "];
               var outCome = [0, 0, 0];
               
               for spin in (0..<3)  {
                   outCome[spin] = Int.random(in: 1..<65);
                   print(outCome[spin]);
                   switch (outCome[spin]) {
                   case checkRange(value: outCome[spin], lowerBounds: 1, upperBounds: 27):  // 41.5% probability
                       betLine[spin] = "Lemon";
                       blanks += 1;
                       break;
                   case checkRange(value: outCome[spin], lowerBounds: 28, upperBounds: 37): // 15.4% probability
                       betLine[spin] = "grape";
                       grape += 1;
                       break;
                   case checkRange(value: outCome[spin], lowerBounds: 38, upperBounds: 46): // 13.8% probability
                       betLine[spin] = "banana";
                       banana += 1;
                       break;
                   case checkRange(value: outCome[spin], lowerBounds: 47, upperBounds: 54): // 12.3% probability
                       betLine[spin] = "orange";
                       orange += 1;
                       break;
                   case checkRange(value: outCome[spin], lowerBounds: 55, upperBounds: 59): //  7.7% probability
                       betLine[spin] = "cherry";
                       cherry += 1;
                       break;
                   case checkRange(value: outCome[spin], lowerBounds: 60, upperBounds: 62): //  4.6% probability
                       betLine[spin] = "Bar";
                       Bar += 1;
                       break;
                   case checkRange(value: outCome[spin], lowerBounds: 63, upperBounds: 64): //  3.1% probability
                       betLine[spin] = "bell";
                       bell += 1;
                       break;
                   case checkRange(value: outCome[spin], lowerBounds: 65, upperBounds: 65): //  1.5% probability
                       betLine[spin] = "seven";
                       seven += 1;
                       break;
                   default:
                       break;
                   }
               }
        
        // if cash is over
          if currentCash <= 0
           {
            gameOver()
        }
               //else
           do {  // update bet stepper
              if Int(stepper.value) > currentCash {
                stepper.maximumValue = Double(currentCash)
                   cashToRisk = currentCash
               stepper.value = Double(currentCash)
              }
         }
        
               return betLine;
        
        
       
          }
    
    
    
        
//        var lastRow = -1
//        var counter = 0
//
//        for i in 0..<pickerView.numberOfComponents{
//            let row : Int = pickerView.selectedRow(inComponent: i) % images.count // selected img idx
//            if lastRow == row{ // two equals indexes
//                counter += 1
//            } else {
//                lastRow = row
//                counter = 1
//            }
//        }
//
//        if counter == 3{ // winning
//            Model.instance.play(sound: Constant.winning_sound)
//            animate(view: machineImageView, images: [#imageLiteral(resourceName: "machine"),#imageLiteral(resourceName: "machine_off")], duration: 1, repeatCount: 15)
//            animate(view: cashImageView, images: [#imageLiteral(resourceName: "change"),#imageLiteral(resourceName: "extra_change")], duration: 1, repeatCount: 15)
//            stepper.maximumValue = Double(currentCash)
//
//            userIndicatorlabel.text = "YOU WON \(200 + cashToRisk * 2)$"
//            Model.instance.updateScore(label: cashLabel,cash: (currentCash + 200) + (cashToRisk * 2))
//        } else { // losing
//            userIndicatorlabel.text = "TRY AGAIN"
//            Model.instance.updateScore(label: cashLabel,cash: (currentCash - cashToRisk))
//        }
//
      
    
  
    
    //MARK: - When user float cash is finished
    
    
    
           func gameOver(){ // when game is over, show alert
               let alert = UIAlertController(title: "Game Over", message: "You have \(currentCash)$ \nPlay Again?", preferredStyle: .alert)
               alert.addAction( UIAlertAction(title: "OK", style: .default, handler: { (_) in
                   self.startGame()
               }))
               self.present(alert, animated: true, completion: nil)
           }
           
    
        
    
    // when spining
        func spinBarAction(_ sender: UITapGestureRecognizer) {
        spinAction()
    }
    
    
    
    
    func spinAction(){
        barImageView.isUserInteractionEnabled = false // disable clicking
        // animation of bandit handle
        animate(view: barImageView, images: #imageLiteral(resourceName: "mot").spriteSheet(cols: 14, rows: 1), duration: 0.5, repeatCount: 1)
        userIndicatorlabel.text = ""
        Model.instance.play(sound: Constant.spin_sound)
        roll()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.checkWin()
            self.determineWinnings()
            self.barImageView.isUserInteractionEnabled = true
        }
        
    }

    
    //MARK: - UIPickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return images.count * 10
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let index = row % images.count
        return UIImageView(image: images[index])
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return images[component].size.height + 1
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.down: self.spinAction()
            default:break
            }
        }
    }
   
}
