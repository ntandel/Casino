
// Assignment 1 SlotMachine
// Date : 22nd jan 2020
// Description :  Creating SlotMachine by parsing jQuery to Swift.
// Version history : 2.0
// Vishal Chanchlani (301090878)
// Vedvrat Singh Parihar (301089005)
// Nisha Tandel (301094688)


import UIKit

struct Constant {
    static let user_cash : String = "cash"
    static let winning_sound : String = "winning"
    static let spin_sound : String = "spin"
    static let is_save_exist : String = "save_exist"
    
}

extension UIViewController{
    func animate(view : UIImageView, images : [UIImage] , duration : TimeInterval , repeatCount : Int){
        view.animationImages = images
        view.animationDuration = duration
        view.animationRepeatCount = repeatCount
        view.startAnimating()
    }
}

extension UIImage{
    
    func spriteSheet(cols : UInt, rows : UInt) -> [UIImage]{
        
        let w = self.size.width / CGFloat(cols)
        let h = self.size.height / CGFloat(rows)
        
        var rect = CGRect(x: 0, y: 0, width: w, height: h)
        var arr : [UIImage] = []
        
        for _ in 0..<rows{
            for _ in 0..<cols{
                
                //crop
                let subImage = self.crop(rect)
                //add to array
                arr.append(subImage)
                
                //go to next image in row
                rect.origin.x += w
            }
            
            //go to next row
            rect.origin.x = 0
            rect.origin.y += h
        }
        
        //done, return the array
        return arr
        
    }
    
    
    func crop(_ rect : CGRect) -> UIImage{
        guard let imageRef = self.cgImage?.cropping(to: rect) else {
            return UIImage()
        }
        return UIImage(cgImage: imageRef)
    }
  
}
