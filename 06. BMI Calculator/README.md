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

To calculate the BMI from height and weight, could create two IBOutlets and get their values, then BMI = weight / pow(height, 2)

## Classes and Inheritance
In xcode, File -> New -> Project..., in the new window, select the macOS tab, and then select the Command Line Tool, which create a project that contains multiple swift files. Name the Product as "ClassesDemo", and create it in a folder. 

In the main.swift file, if we have `print("hello")` and run it, it will get printed from the console. Now, create a new swift file in the project, and name it as "Enemy". Inside this new file, create a new class called Enemy. It is a convention that the name of the file exactly matches the name of the class. In Enemy.swift file:
```
class Enemy {
    var health = 100
    var attackStrength = 10
    
    func move() {
        print("walk forwards.")
    }
    
    func attack() {
        print("Land a hit, does \(attackStrength) damage.")
    }
}
```
And in main.swift file:
```
let skeleton = Enemy()
print(skeleton.health)
skeleton.move()
skeleton.attack()

let skeleton2 = Enemy()
let skeleton3 = Enemy()
```

This is pretty much what a struct can do. However, class could inherit from a SuperClass. Create Dragon.swift file:
```
class Dragon: Enemy { // Dragon class inherits Enemy class
    var wingSpan = 2
    
    func talk(speech: String) {
        print("Says: \(speech)")
    }
    
    override func move() { // override a method
        print("Fly forwards. ")
    }
    
    override func attack() {
        super.attack()
        print("Spits fire, does 10 damage. ") // add additional attack
    }
}
```
And in main.swift file:
```
let dragon = Dragon()
dragon.move()
dragon.attack()
dragon.wingSpan = 5
dragon.attackStrength = 15
dragon.talk(speech: "I am a round dragon. ")
```

Apple's most basic class is the NSObject. For example, UIResponder inherits it, which is in inherited by UIView and then UIControl, then UIButton. At each level, more code and more capabilities are added so that component become less generic and more specialized. 

## Struct v.s. Classes














