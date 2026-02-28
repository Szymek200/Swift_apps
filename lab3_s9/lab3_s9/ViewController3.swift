//
//  ViewController3.swift
//  lab3_s9
//
//  Created by student on 16/01/2026.
//

import UIKit

class ViewController3: UIViewController, UIImagePickerControllerDelegate,
                       UINavigationControllerDelegate, UIGestureRecognizerDelegate{

    
    @IBOutlet weak var imagePicked: UIImageView!
    
    var newPhoto = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Tworzy rozpoznawanie gestu uszczypnięcia.
                let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
        
        pinchGesture.delegate = self
                
                // Tworzy rozpoznawanie gestu obrotu.
                let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate(_:)))
        
        rotationGesture.delegate = self
                
                // Dodaje gesty do widoku obrazu.
                imagePicked.addGestureRecognizer(pinchGesture)
                imagePicked.addGestureRecognizer(rotationGesture)

        // Do any additional setup after loading the view.
    }
    
    
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
    shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer)
    -> Bool {
    return true
    }
    
    // Obsługuje gest uszczypnięcia (skalowanie).
        @objc func handlePinch(_ recognizer: UIPinchGestureRecognizer) {
            guard let view = recognizer.view else { return }
            
            // Modyfikuje transformację widoku o wartość skali.
            view.transform = view.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
            
            // Resetuje skalę gestu do wartości domyślnej.
            recognizer.scale = 1.0
        }
        
        // Obsługuje gest obrotu (rotacja).
        @objc func handleRotate(_ recognizer: UIRotationGestureRecognizer) {
            guard let view = recognizer.view else { return }
            
            // Modyfikuje transformację widoku o wartość kąta obrotu.
            view.transform = view.transform.rotated(by: recognizer.rotation)
            
            // Resetuje obrót gestu do wartości domyślnej.
            recognizer.rotation = 0.0
        }
    
    
    //metoda podpięta pod przycisk Aparat
    @IBAction func openCameraButton(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.cameraDevice = .front
   
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
            newPhoto = true
        }
    }
        //metoda podpięta pod przycisk Galeria
    @IBAction func openPhotoLibraryButton(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
        //metoda delegate wywołana po zrobieniu zdjęcia lub wyborze zdjęcia w galerii
    func imagePickerController(_ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
                    imagePicked.image = image
                    dismiss(animated:true, completion: nil)
                //zapis zdjęcia
                if (newPhoto == true) {
                    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                    newPhoto = false
                }
        }
    
}
