//
//  ViewController4.swift
//  lab3_s9
//
//  Created by student on 16/01/2026.
//

import UIKit
import CoreLocation
import MapKit

class ViewController4: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    
    // Zmienne przeniesione na poziom klasy, aby były widoczne w metodach.
    var placemark: CLPlacemark?
    var performingReverseGeocoding = false
    var lastGeocodingError: Error?
    
    // Zmienna do przechowywania ostatniej pobranej lokalizacji.
    var currentLocation: CLLocation?
    
    @IBOutlet weak var longtitude: UILabel!
    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Konfiguruje menadżera lokalizacji.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters

        // Sprawdza status autoryzacji.
        let authStatus = CLLocationManager.authorizationStatus()
        if authStatus == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    // Rozpoczyna pobieranie lokalizacji po kliknięciu przycisku.
    @IBAction func getLocation(_ sender: Any) {
        locationManager.startUpdatingLocation()
    }
    
    // Obsługuje błędy lokalizacji.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("didFailWithError \(error)")
    }
    
    // Odbiera nowe dane o lokalizacji.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let newLocation = locations.last!
        
        // Zapisuje aktualną lokalizację do zmiennej klasowej.
        currentLocation = newLocation
        
        print("didUpdateLocations \(newLocation)")
        
        // Aktualizuje etykiety.
        latitude.text = "\(newLocation.coordinate.latitude)"
        longtitude.text = "\(newLocation.coordinate.longitude)"
        
        // Zatrzymuje pobieranie lokalizacji (oszczędność baterii), jeśli potrzebujemy tylko jednej pozycji.
        // manager.stopUpdatingLocation()
    }
    
    // Pokazuje lokalizację na mapie po kliknięciu przycisku.
    @IBAction func showLocation(_ sender: Any) {
        
        // Sprawdza, czy mamy pobraną lokalizację.
        guard let location = currentLocation else {
            print("Brak danych o lokalizacji. Kliknij najpierw Get Location.")
            return
        }
        
        // Wykonuje Reverse Geocoding (zamiana współrzędnych na adres).
        if !performingReverseGeocoding {
            performingReverseGeocoding = true
            
            geocoder.reverseGeocodeLocation(location) { [weak self] (placemarks, error) in
                
                
                self?.performingReverseGeocoding = false
                
                if let error = error {
                    print("Błąd geokodowania: \(error)")
                    return
                }
                
                if let placemarks = placemarks, let placemark = placemarks.last {
                    
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = location.coordinate
                    
                   
                    annotation.title = "\(placemark.locality ?? "") \(placemark.thoroughfare ?? "")"
                    annotation.subtitle = placemark.postalCode
                    
                 
                    self?.map.addAnnotation(annotation)
                    
                 
                    let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
                    self?.map.setRegion(region, animated: true)
                }
            }
        }
    }
}
