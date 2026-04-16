# Swift iOS Development Portfolio

## Overview
This repository contains a collection of iOS applications developed to explore the core frameworks of the Apple ecosystem. The projects range from game logic and custom graphics to advanced multimedia and location services.

---

## Contents

### 1. Pointer Hunter
An accuracy-based game where players must match a target value using a slider.
* **Core Mechanic**: Random target generation (1–100) and precision matching.
* **Scoring**: Dynamic point calculation based on the absolute difference between the slider and the target.
* **Audio**: Implements `AVFoundation` for "Nice Shot" and victory sound effects.
* **UI**: Features a custom-styled `UISlider` with unique thumb and track assets.

### 2. Interactive Face & Audio Engine 
A creative exploration of custom drawing, design patterns, and low-level audio processing.
* **Custom Graphics**: The `FaceView` class uses `UIBezierPath` to procedurally draw a face, eyes, and a mouth.
* **Interaction Design**: 
    * **RGB Customization**: Adjust face and eye colors via sliders.
    * **Delegate Pattern**: Controls smile curvature using a custom protocol (`myProtocol`).
    * **Motion Events**: Randomizes eye colors through device shake detection.
* **Audio Engineering**: Utilizes `AVAudioEngine` with `AVAudioUnitVarispeed` and `AVAudioUnitTimePitch` for real-time pitch and speed manipulation.

### 3. Gestures, Media & Location 
A technical showcase of advanced iOS hardware and gesture capabilities.
* **Gesture Recognition**: Support for pan, pinch-to-zoom, and two-finger rotation on UI elements.
* **Multimedia**: Camera and Photo Library integration using `UIImagePickerController` with auto-save functionality.
* **Mapping**: Real-time GPS tracking using `CoreLocation` and interactive map rendering via `MapKit`.
* **Geocoding**: Conversion of coordinates into human-readable addresses (Reverse Geocoding).
