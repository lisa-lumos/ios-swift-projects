# 3. Xylophone

## Get started
Go to Main.storyboard, and hold down `control` key and drag it to the ViewController.swift, below the viewDidLoad() function, and create an Action connection, named "keyPressed", type as `"UIButton"`. Then click "Connect". Now whenever the image is tapped, the keyPressed function will be triggered. 

To get documentation, go to `https://developer.apple.com/documentation`. Or simply Google "play sound swift stackoverflow". 

We could `override` the default audio play session, so the sound will be played even if the phone is silenced. You can find related documentation in apple API docs. An alternative is to hold down `option` key and hover over the purple colored API functions, and you can see the cursor then turns into a question mark. Click on it, a `quick documentation` will pop up for quick look up, a link at the bottom of the pop up window will bring you to the `full documentation`. 

```
import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        // print("I got pressed. ")
        playSound()
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "C", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
```

## Swift Functions and Scope
```
func getMilk() { // do stuff } // create a function
getMilk() // call the function

func getMilk(bottles Int) { // do stuff } // create a function
getMilk(bottles: 2) // call the function

func greeting1(){
    print("Hello")
    func greeting2() { // This function is only accesible from inside greeting1()
        print("hey")
    }
}
```
To indent code, `Editor` -> `Structure` -> `Re-indent`

## Link mulitple buttions to the same IBAction
Hover over the circle preceding the `keyPressed` function, you can see that it highlights the top button. Now, `drag and drop` the circle to the rest of the buttons in storyboard. 

To know the `data type` of a variable, hold on `Option` key and click on that variable. 
```
import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        // print("I got pressed. ")
        // print(sender)
        // print(sender.backgroundColor)
        // var num = 3;
        // var num: Int = 3;
        // print(sender.currentTitle)
        // playSound(soundName: "C")
        playSound(soundName: sender.currentTitle!)
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
```

## Button press animation
Dim the button that was pressed by 0.1 seconds and then make it go back to its original opacity to achieve the effect of an `animated button press`.
```
sender.alpha = 0.5
DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
    sender.alpha = 1.0
}
```

















