//
//  ViewController4.swift
//  lab2_sekcjaX
//
//  Created by student on 25/11/2025.
//

import UIKit
import AVFoundation


class ViewController4: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    let engine = AVAudioEngine()
    let speedControl = AVAudioUnitVarispeed()
    let pitchControl = AVAudioUnitTimePitch()
    func play() throws {
    // 1: Wczytanie przykładowego pliku o nazwie Intro.mp3
    let fileURL = Bundle.main.url(forResource: "Intro", withExtension: "mp3")
    let file = try AVAudioFile(forReading: fileURL!)
    // 2: utworzenie obiektu AudioPlayer
    let audioPlayer = AVAudioPlayerNode()
    // 3: podłączenie komponentów do obiektu engine
    engine.attach(audioPlayer)
    pitchControl.pitch = 0
    engine.attach(pitchControl)
    speedControl.rate = 1
    engine.attach(speedControl)
    engine.connect(audioPlayer, to: speedControl, format: nil)
    engine.connect(speedControl, to: pitchControl, format: nil)
    engine.connect(pitchControl, to: engine.mainMixerNode, format: nil)
    // 4: przygotowanie playera do odtwarzania pliku
    audioPlayer.scheduleFile(file, at: nil)
    // 5: uruchomienie obiektu engine i odtwarzacza
    try engine.start()
    audioPlayer.play()
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
