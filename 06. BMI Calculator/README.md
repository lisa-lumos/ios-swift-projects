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
With struct, you get the initializer for free, no need for a init method. But with class, if the instance vars have no vals, then you need to type a init method. When you assign an existing object to new object name, it actually refers to the same object. But with structs, because they are immutable, when you assign a existing struct to another struct name, it actually makes a deep copy, so you get two structs. In short, structs are passed by value, while classes are passed by reference. 

Apple recommends that you always use structures by default. But if you need inheritance, or need to work with c#, they you can turn your structure into a class. 

## Create a custom UIViewController class
Right click on the folder "Controllers", and create a new swift file named "SecondViewController.swift". Now try to create a similar class that looks like the one in "ViewController.swift". 

```
import UIKit

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    } 
}
```

Note that we need to import UIKit to be able to access the names that starts with UI. Help -> Developer Documentation... , we can find a section on UIKit. If you're using UIKit, Foundation is already implemented in it so you don't need to import it twice.

## Create a UI programmatically and pass data between ViewControllers
UILabel inherits UIView (option and click to inspect). 

In SecondViewController.swift:
```
import UIKit

class SecondViewController: UIViewController {
    
    var bmiValue = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        let label = UILabel()
        label.text = bmiValue
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        view.addSubview(label)
    }
}
```

In ViewController.swift, inside the ViewController class:
```
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        let bmi = weight / (height * height)
        // print(bmi)
        
        let secondVC = SecondViewController()
        secondVC.bmiValue = String(format: "%.1f", bmi)
        
        self.present(secondVC, animated: true, completion: nil)
    }
```

















