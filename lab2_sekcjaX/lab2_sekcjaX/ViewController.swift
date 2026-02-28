//
//  ViewController.swift
//  lab2_sekcjaX
//
//  Created by MM on 21/11/2022.
//

import UIKit
import AVFAudio

class ViewController: UIViewController, myProtocol{
    func protocolFunction(smile: Float) {
        face.smile = smile
        face.setNeedsDisplay()
        
        dismiss(animated: true)
    }
    

    @IBOutlet weak var face: FaceView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        face.setNeedsDisplay()
        
        face.colRed = 1
        face.colGreen = 0
        face.colBlue = 0
        // Do any additional setup after loading the view, typically from a nib.
        //becomeFirstResponder()
        
        face.LRed = 1
        face.LGreen = 1
        face.LBlue = 1
        
        face.RRed = 1
        face.RGreen = 1
        face.RBlue = 1
    }
    
    
    @IBAction func returnFromView(_ seque: UIStoryboardSegue){
        let sourceView =  seque.source as! ViewController2
        
        
        face.colRed = sourceView.redSlider.value
        face.colGreen = sourceView.greenSlider.value
        face.colBlue = sourceView.blueSlider.value
        
        face.setNeedsDisplay()
        
    }
    
    
    override func prepare(for seque: UIStoryboardSegue,  sender: Any?)
    {
        if seque.identifier == "goToColors"
        {
            var destinationView =  seque.destination as! ViewController2
            //drugiego widoku jeszcze nie ma stworzonego
            
            destinationView.red = face.colRed
            destinationView.green = face.colGreen
            destinationView.blue = face.colBlue
        }
        else if seque.identifier == "goToHappy"
        {
            var destinationView =  seque.destination as! ViewController3
            destinationView.delegate = self
        }
    }
    
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    
        if motion == .motionShake {
            face.LRed = Float.random(in: 0...1)
            face.LGreen = Float.random(in: 0...1)
            face.LBlue = Float.random(in: 0...1)
            
            face.RRed = Float.random(in: 0...1)
            face.RGreen = Float.random(in: 0...1)
            face.RBlue = Float.random(in: 0...1)
            face.setNeedsDisplay()
        }
   }
    
    
    
    
}
