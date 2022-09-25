# 4. Egg Timer App

## Getting Started
To prevent the text in a `Label` component from getting `truncated` due to smaller screen size, there are two ways: 
1. Click on this label in storyboard, and in the right pane of attributes, set the `Lines` attribute to `0`, this will remove the limit to the number of lines inside the Label, and it will `keep the font size`, and create as many lines as needed so it can fit into the Label size. 
3. But if you have too many contents inside the label, it will still overflow. Then you can change the `Autoshrink` property to specify a `minimum font size`. Then it will shrink the font size if it will overflow, and only overflows if it reaches the minimum font size and still have not enough space inside the Label's size. 

In current storyboard, there is a button underneath each egg ImageView, we didn't put image inside buttons because it needs a lot more efforts to make the images fit to correct size. Each button has a Title attribute of either Soft or Medium or Hard, in plain text. Now drag each button so they appear to be on top of their egg image. 

Now create an `IBAction` inside the `UIViewController` class to link all 3 buttons to it. Make sure you choose `Connection` field as `Action`, and `Type` field as `UIButton`. Also, note that it is more precise to use the `Document Outline` pane (aka the left pane) when you drag and drop the circle from code. 

## Switch statement
```
switch hardnessChosen {
    case "Soft": print(softTime)
    case "Medium": print(mediumTime)
    case "Hard": print(hardTime)
    default: print("Error")
}

switch number {
    case 0..<10: print("[0, 10)")
    case 10..<20: print("[10, 20)")
    case 20...100: print("[20, 100]")
    default: print("Error")
}

```

## Dictionaries and arrays
```
// dictionary, retrieve using dict["key1"]
var dict1 = ["key1" : "value1", "key2" : "value2"]
var dict2 : [String : String] = ["key1" : "value1", "key2" : "value2"]

// Array, idx starts at 0, retrieve using arr[0]
var arr = [1, 2, 3]
```

## Optionals
Often, you need a variable, that it often need to start with no data inside. For example, you have a field in the app where you were going to save the user's username. Before it gets values, this field is going to be `nil`. At a later date, when you need this field to display it on screen, you hope that the user has filled it in. Swift use `optionals` to represent this uncertainty. 

When decalring a variable, like `var hardness: String`, after the datatype String, append a question mark to turn it into an `optional data type`: `var hardness: String?`, so this var can store a string, or it can simply be empty. 

```
var username: String? = nil
username = "lisa"
print(username)  // return: Optional("lisa")
print(username!) // force unwrap into a string, return: lisa

username = nil
print(username!) // return: Fatal error: ...

if username != nil {
    ... // now it is safe to use it
}
```

## Create a timer, and change label text when done
```
import UIKit

class ViewController: UIViewController {
    let timeMap = ["Soft": 5, "Medium": 7, "Hard": 12]
    var time = 0
    var timer = Timer()
    @IBOutlet weak var titleLabel: UILabel! // control and drag label to here
    
    @IBAction func softEggButton(_ sender: UIButton) {
        // print(sender.currentTitle)
        let hardnessChosen = sender.currentTitle!
        // print(timeMap[hardnessChosen]!)
        time = timeMap[hardnessChosen]! // * 60
        
        timer.invalidate() // so previous timer can be ended, if it is running
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                          target: self,
                          selector: #selector(updateTimer),
                          userInfo: nil,
                          repeats: true)
        
    }
    
    @objc private func updateTimer() {
        if time == 0 {
            print("\(time) seconds.")
            timer.invalidate() // invalidating timer
            titleLabel.text = "Done!"
        } else {
            print("\(time) seconds.")
            time -= 1
        }
    }    
}
```

## UIProgressView to visualize time remaining
Set storyboard to be active window, and add `Progress View` into the board. Adjust its vertical centering and margins. Then change the `Style` attribute of this object to `Bar`, so we can set its height to 5px in constraints. Change the `Progess Tint` attribute to system yellow color, and `Track Tint` to system grey color. In attributes pane, there's a `Progress` which controls percentage of progress of the bar. 

```
import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    let timeMap = ["Soft": 5, "Medium": 7, "Hard": 12]
    var totalTime = 0
    var timePassed = 0
    var timer = Timer()
    var player: AVAudioPlayer!

    @IBAction func softEggButton(_ sender: UIButton) {
        // print(sender.currentTitle)
        let hardnessChosen = sender.currentTitle!
        // print(timeMap[hardnessChosen]!)
        totalTime = timeMap[hardnessChosen]! // * 60
        timePassed = 0
        titleLabel.text = hardnessChosen
        timer.invalidate() // so previous timer can be ended, if it is running
        progressBar.progress = 0.0
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                          target: self,
                          selector: #selector(updateTimer),
                          userInfo: nil,
                          repeats: true)
        
    }
    
    @objc private func updateTimer() {
        if timePassed == totalTime-1 {
            // print("\(timePassed) seconds.")
            timer.invalidate() // invalidating timer
            titleLabel.text = "Done!"
            playSound()
            progressBar.progress = 1
        } else {
            // print("\(timePassed) seconds.")
            timePassed += 1
            // titleLabel.text = "\(timePassed) seconds passed."
            progressBar.progress = Float(timePassed)/Float(totalTime)

        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }

}

```