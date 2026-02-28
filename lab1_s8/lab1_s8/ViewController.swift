//
//  ViewController.swift
//  lab1_s8
//
//  Created by student on 28/10/2025.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {


    var number: Float = 1.0
    var number2: Int = 1
    
    var losowaZmienna: Int = 0
    
    var sumaPunktow: Int = 0
    
    var wartoscSuwak: Int = 0
    
    var runda: Int = 0
    
    let sound = Bundle.main.url(forResource: "restart", withExtension: "mp3")!
    var audioPlayer = AVAudioPlayer()
    
    
    let sound2 = Bundle.main.url(forResource: "nice_shot", withExtension: "mp3")!
    var audioPlayer2 = AVAudioPlayer()
    
    
    let sound3 = Bundle.main.url(forResource: "win", withExtension: "mp3")!
    var audioPlayer3 = AVAudioPlayer()
    
    
    let thumbImageNormal = UIImage(named: "SliderIcon.png")!
 
    
    @IBOutlet weak var suwak: UISlider!
    
    @IBOutlet weak var obrazek: UIImageView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        losowaZmienna = Int.random(in: 1...100)
        
        sumaPunktow = 0
        runda = 1
        
        //czy konwertowac
        losowaWartosc.text = "\(losowaZmienna)"
        
        iloscPunktow.text = "\(sumaPunktow)"
        
        numerRundy.text = "\(runda)"
        
        

        let insets = UIEdgeInsets(
        top: 0,
        left: 14,
        bottom: 0,
        right: 14)
        
        
        let trackLeftImage = UIImage(named: "SliderLeft.png")!
        suwak.setThumbImage(thumbImageNormal, for: .normal)
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        
        suwak.setMinimumTrackImage(trackLeftResizable, for: .normal)
        let trackRightImage = UIImage(named: "SliderRight.png")!
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        
        
        suwak.setMaximumTrackImage(trackRightResizable, for:.normal)
        
        
    }
   
    
   
    
  
    
    
    
    

  
  
    
    @IBOutlet weak var losowaWartosc: UILabel!	
    
    
    @IBAction func sprawdzenie(_ sender: Any) {
        
       
        let zysk = 100 - abs(losowaZmienna - Int(wartoscSuwak))
        sumaPunktow += sumaPunktow + zysk
        
        userWartosc.text = "\(zysk)"
        
        if zysk > 80
        {
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: sound2)
                audioPlayer.play()
            }
            catch
            {
                print("Nie mozna odtworzyc dzwieku")
            }
        }
        
        
        let alert = UIAlertController(title: "Zysk", message: "Teraz uzyskales \(zysk)", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        
        if runda < 10{
            runda += 1
            
            iloscPunktow.text = "\(sumaPunktow)"
            
            numerRundy.text = "\(runda)"
            
            losowaZmienna = Int.random(in: 1...100)
            
            losowaWartosc.text = "\(losowaZmienna)"
        }
        else
        {
            
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: sound3)
                audioPlayer.play()
            }
            catch
            {
                print("Nie mozna odtworzyc dzwieku")
            }
            restart(self)
        }
        
        
        
        //handler: {_ in self.restart(self)}
        
        
        
    }
    
    
    @IBOutlet weak var userWartosc: UILabel!
    
    @IBAction func restart(_ sender: Any) {
        
        losowaZmienna = Int.random(in: 1...100)
        
        runda = 0
        
        sumaPunktow = 0
        
        //czy konwertowac
        losowaWartosc.text = "\(losowaZmienna)"
        
        iloscPunktow.text = "\(sumaPunktow)"
        
        numerRundy.text = "\(runda)"
        
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: sound)
            audioPlayer.play()
        }
        catch
        {
            print("Nie mozna odtworzyc dzwieku")
        }
    
    }
    
    @IBOutlet weak var iloscPunktow: UILabel!
    
    
    
    @IBOutlet weak var numerRundy: UILabel!
    
    
    
    
}

