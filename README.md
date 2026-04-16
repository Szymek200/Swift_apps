# Interactive Face Customizer 

## Description
This iOS application, developed with **Swift** and **UIKit**, features a custom-drawn interactive face. Users can manipulate the face's appearance through color sliders, smile adjustments, and physical device motion. The project also demonstrates advanced audio processing techniques.

## Key Features

### 1. Custom Graphic Rendering
* **Procedural Drawing**: The `FaceView` class uses `UIBezierPath` and `draw(_ rect:)` to render a face, two eyes, and a mouth.
* **Dynamic Styling**: The background color of the face and the colors of the left and right eyes are driven by individual RGB variables.
* **Smile Curvature**: The mouth is drawn using a quadratic Bézier curve where the control point is adjusted dynamically to change the "happiness" level of the face.

### 2. Interactive Customization
* **Color Selection**: Users can adjust the face's Red, Green, and Blue components using sliders in a secondary view. Data is returned to the main view using an **Unwind Segue**.
* **Smile Control**: A dedicated controller allows users to adjust the smile depth. This utilizes a **Delegate Pattern** (`myProtocol`) to communicate changes back to the main view.
* **Shake to Randomize**: Detecting a device shake motion triggers a function that randomizes the colors of the eyes.

### 3. Advanced Audio Engine
* **Multimedia Processing**: The app implements an `AVAudioEngine` pipeline.
* **Pitch & Speed Effects**: Integrates `AVAudioUnitVarispeed` and `AVAudioUnitTimePitch` to allow real-time modification of audio playback speed and pitch for the "Intro.mp3" file.

## Project Structure
* **FaceView.swift**: The core custom UIView containing the mathematical drawing logic.
* **ViewController.swift**: The main controller managing the face, motion events, and navigation.
* **ViewController2.swift**: Manages RGB sliders for face color customization.
* **ViewController3.swift**: Defines the communication protocol and manages the smile intensity.
* **ViewController4.swift**: Implements the audio engine and sound processing effects.

## How to Play
1.  **Modify the Face**: Tap the navigation buttons to access the Color or Smile settings.
2.  **Shake the Device**: Shake your iPhone (or use `Cmd + Ctrl + Z` in the simulator) to randomize the eye colors.
3.  **Experiment with Audio**: Visit the audio section to hear how pitch and speed controls affect playback.
