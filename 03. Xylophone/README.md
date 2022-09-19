# 3. Xylophone

## Get started
Go to Main.storyboard, and hold down control key and drag it to the ViewController.swift, below the viewDidLoad() function, and create an Action connection, named "keyPressed", type as "UIButton". Then click "Connect". Now whenever the image is tapped, the keyPressed function will be triggered. 

To get documentation, go to `https://developer.apple.com/documentation`. Or simply Google "play sound swift stackoverflow". 

We could override the default audio play session, so the sound will be played even if the phone is silenced. You can find related documentation in apple API docs. An alternative is to hold down option key and hover over the purple colored API functions, and you can see the cursor then turns into a question mark. Click on it, a quick documentation will pop up for quick look up, a link at the bottom of the pop up window will bring you to the full documentation. 

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






























