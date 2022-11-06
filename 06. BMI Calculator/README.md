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

## Segues and Navigation for Multi-Screen Apps
There's a much easier way of presenting a second screen. Delete the SecondViewController.swift file, and File -> New -> File..., under Source pane, choose Cocoa Touch Class, instead of Swift File this time. Class: ResultViewController, Next, Subclass of: UIViewController, Next, Group: Controllers, Create. Now you have got a template:

```
import UIKit

class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
```

Next, go to Main.storyboard, and click to select the pre-designed second screen in the left panel, in the right most panel, on the top bar, click on the icon that shows the identity inspector, Class: ResultViewController. 

Go to Assistant view, and put the ResultViewController and its controller file side by side. Create an IBOutlet for the Label that displays bmi value, and name it bmiLabel. Do the same with adviceLabel. Create an IBAction for the Recalculate button named recalculatePressed. 

It is better if the name of the controller file could tell us which screen it manages, so rename the ViewController.swift as CalculateViewController. To do this, the easiest way (one place change all) is to open this file, and right click on the class name, and Refactor -> Rename...

Previously, we had to manually link the second view controller using `let secondVC = SecondViewController()`. The much easier way to do this is to create a Segue. To do this, click to select the Calculate View Controller in the left pane in the storyboard view, and hold on control key and drag it to the Result View Controller in the same pane. Select Present Modally. Then in the screen graphical view pane, there is an arrow connecting first screen to the second screen. There is an icon in the middle of the arrow that allow you to change the transition type. Click on this icon, and show the Attributes inspector on the right pane, Identifier: goToResult. 

To use this Segue, go to CalculateViewController.swift, and replace the `let secondVC = SecondViewController()` and following two lines with `self.performSegue(withIdentifier: "goToResult", sender: self)`. Now if run the app, and click the calculate button, it will show the second screen. If there's an error like `'NSUnknownKeyException', reason: ... this class is not key value coding-compliant for the key ...`, then make sure that the Result View Controller, Identity inspector, under Custom Class pane, the Module filed is not empty (either Inherit Module from Target is checked, or BMI_Calculator is selected from the drop-down menu). 







