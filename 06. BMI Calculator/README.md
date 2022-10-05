# BMI Calculator
## Getting started
Create IBAction on two sliders, and show their value back to the UI label: 
```
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        // print(round(sender.value * 100)/100.0)
        // String(format: "%.2f", sender.value)
        heightLabel.text = String(format: "%.2f", sender.value) + " m"
    }
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        // print(Int(sender.value))
        weightLabel.text = String(format: "%.0f", sender.value) + " kg"
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
```
































