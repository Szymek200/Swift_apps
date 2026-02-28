//
//  ViewController.swift
//  lab3_s9
//
//  Created by student on 16/01/2026.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func handlePan(_ recognizer:UIPanGestureRecognizer) {
    let translation = recognizer.translation(in: self.view)
    if let view = recognizer.view {
    view.center = CGPoint(x:view.center.x + translation.x,
    y:view.center.y + translation.y)}
    recognizer.setTranslation(CGPoint.zero, in: self.view)
    }
    
}

