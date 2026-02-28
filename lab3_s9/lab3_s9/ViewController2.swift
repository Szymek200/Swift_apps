//
//  ViewController2.swift
//  lab3_s9
//
//  Created by student on 16/01/2026.
//

import UIKit

class ViewController2: UIViewController {

    var seconds = 0

    
    var timer = Timer()
    
    var tapRecognizer: UITapGestureRecognizer!
    
    var tapRecognizer2: UITapGestureRecognizer!
    
    var swipeRecognizer: UISwipeGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       // timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:
        //#selector(funkcja_obslugi), userInfo: nil, repeats: true)
        
       
        
       tapRecognizer = UITapGestureRecognizer(target:
                                                self, action: #selector(handleTap))
        tapRecognizer.numberOfTouchesRequired = 1
        view.addGestureRecognizer(tapRecognizer)
        
        tapRecognizer2 = UITapGestureRecognizer(target:
                                                 self, action: #selector(handleTap2))
         tapRecognizer2.numberOfTouchesRequired = 2
         view.addGestureRecognizer(tapRecognizer2)
        
        
        swipeRecognizer = UISwipeGestureRecognizer(target:
        self, action: #selector(handleSwipes))
        /* Swipes that are performed from right to
        left are to be detected */
        swipeRecognizer.direction = .right
        /* Just one finger needed */
        swipeRecognizer.numberOfTouchesRequired = 1
        /* Add it to the view */
        view.addGestureRecognizer(swipeRecognizer)
        
        /* Swipes that are performed from right to
        left are to be detected */
        
        tapRecognizer.require(toFail: tapRecognizer2)
     
    }
    

    @IBOutlet weak var displayTime: UILabel!
    

    
  	
    
    
    @objc func handleTap(sender: UITapGestureRecognizer){
    print("Funkcja wywoływana przez obiekt klasy Timer")
        
        //timer start
        
        if !timer.isValid {
             timer = Timer.scheduledTimer(
                 timeInterval: 1,
                 target: self,
                 selector: #selector(funkcja_obslugi),
                 userInfo: nil,
                 repeats: true
             )
         }
        
        
    }
    
    @objc func handleTap2(sender: UITapGestureRecognizer){
    print("Funkcja wywoływana przez obiekt klasy Timer")
        
        //timer stop
        timer.invalidate()
    
        
    }
    
    
    @objc func handleSwipes(sender: UISwipeGestureRecognizer){
   
        if sender.direction == .right{
         
            
            //zertowanie timera
            seconds = 0
                    displayTime.text = "0"
            
            	
        }
   
    }
    
    @objc func funkcja_obslugi(){
   
        
         
            
            //timer
        seconds += 1
           displayTime.text = "\(seconds)"
            
                
        
   
    }
    
    
    
}
