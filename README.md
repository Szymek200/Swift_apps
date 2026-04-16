# iOS Interaction & Multimedia Project

## Overview
This project is a multi-feature iOS application developed using **Swift** and **UIKit**. It serves as a comprehensive demonstration of core iOS frameworks, including gesture recognition, multimedia handling, location services, and map integration.

## Features

### 1. Interactive Gestures (Core Navigation & Manipulation)
* **Pan Manipulation**: Allows users to drag and move specific UI elements across the screen using `UIPanGestureRecognizer`.
* **Image Scaling & Rotation**: Users can interact with images using multi-touch gestures. It supports pinching to zoom/scale and two-finger rotation to adjust the image orientation.
* **Simultaneous Recognition**: The app is configured to handle multiple gestures at once (e.g., rotating while scaling).

### 2. Gesture-Controlled Timer
A dedicated view controller implements a custom timer controlled entirely by touch interactions:
* **Single Tap**: Starts or resumes the timer.
* **Double Tap**: Pauses/stops the timer.
* **Right Swipe**: Resets the timer and the display to zero.

### 3. Multimedia & Camera Integration
The app utilizes `UIImagePickerController` to interact with the device's media hardware:
* **Camera Access**: Capture new photos directly within the app using the front camera.
* **Photo Library**: Import existing images from the system gallery.
* **Auto-Save**: New photos taken via the camera can be automatically saved to the user's system photo album.

### 4. Location Services & Mapping
Integrated using `CoreLocation` and `MapKit` to provide real-time geographic data:
* **Coordinate Tracking**: Fetches and displays the user's current latitude and longitude with high accuracy.
* **Map Visualization**: Displays the user's position on an interactive `MKMapView`.
* **Reverse Geocoding**: Converts raw GPS coordinates into human-readable addresses (City, Street, and Postal Code) and displays them as map annotations.

## Technical Structure
* **ViewController.swift**: Handles basic pan gestures for view movement.
* **ViewController2.swift**: Manages timer logic and tap/swipe gesture coordination.
* **ViewController3.swift**: Controls image picking, camera interface, and advanced transform gestures (pinch/rotate).
* **ViewController4.swift**: Implements `CLLocationManagerDelegate` for location updates and map rendering.
* **SceneDelegate.swift**: Manages the standard UI lifecycle and window configuration.


