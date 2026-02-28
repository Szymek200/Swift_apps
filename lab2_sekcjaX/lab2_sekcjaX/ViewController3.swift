//
//  ViewController3.swift
//  lab2_sekcjaX
//
//  Created by student on 25/11/2025.
//

import UIKit


//definicja protokolu

protocol myProtocol{
    func protocolFunction(smile: Float)
}

class ViewController3: UIViewController {

    //odbiorca informacji - viewController
    var delegate: myProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var happySlider: UISlider!
    
   
    @IBAction func returnButton(_ sender: UIButton) {
        delegate?.protocolFunction(smile: happySlider.value)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
