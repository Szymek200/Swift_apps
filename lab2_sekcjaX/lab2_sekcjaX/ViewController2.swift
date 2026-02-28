//
//  ViewController2.swift
//  lab2_sekcjaX
//
//  Created by student on 25/11/2025.
//

import UIKit

class ViewController2: UIViewController {

    //wartosci z prepare
    var red:Float = 0
    var green:Float = 0
    var blue:Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSlider.value = red
        greenSlider.value = green
        blueSlider.value = blue
        // Do any additional setup after loading the view.
    }
    

  
    
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var greenSlider: UISlider!
  
    
    @IBOutlet weak var blueSlider: UISlider!
    
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
