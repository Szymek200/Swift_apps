# Point Hunter

## Description
This is an accuracy-based mobile game developed for iOS where players attempt to match a target value using a slider. The closer the slider is to the target, the higher the score.

## Features
* **Dynamic Target Generation**: At the start of each round, the game generates a random target number between 1 and 100.
* **Scoring Logic**: Points are calculated based on the precision of the slider's placement.
    * The score for a round is determined by: `100 - abs(TargetValue - SliderValue)`.
* **Round Management**: Each game session consists of 10 rounds. The app tracks the current round number and the player's total accumulated score.
* **Custom UI Styling**: The interface includes custom graphics for the `UISlider`, featuring unique thumb icons and resizable track images for a polished look.
* **Audio Integration**: The game uses `AVFoundation` to provide audio feedback:
    * **Success Sound**: Plays a "nice shot" audio clip if the player scores over 80 points in a single turn.
    * **Winning Sound**: Plays a victory sound effect upon completing the 10th round.
    * **Reset Sound**: Includes a distinct sound for restarting the game session.

## Technical Structure
The project is built using **Swift** and the **UIKit** framework.

* **ViewController.swift**: Contains the core game loop, including random number generation, scoring math, UI outlet management, and audio playback logic.
* **AppDelegate.swift**: Manages the application-level lifecycle and initial configurations.
* **SceneDelegate.swift**: Handles the setup of the app's window and UI scene lifecycle.

## How to Play
1. Observe the random target number displayed on the screen.
2. Adjust the slider to match where you think that number falls between 1 and 100.
3. Tap the check button to submit your guess and see your round score.
4. Try to get the highest total score possible across all 10 rounds.
