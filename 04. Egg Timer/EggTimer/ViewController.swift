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
