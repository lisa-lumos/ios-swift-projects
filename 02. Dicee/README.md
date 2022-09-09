# 2. Dicee App
The skeleton of this app if cloned from `https://github.com/appbrewery/Dicee-iOS13`.

To find a list of open source iOS apps: `https://github.com/dkhamsing/open-source-ios-apps`

## Build the UI
Go to Storyboard, drag an `Image View` component to create a background image. Resize it to cover the whole screen. Add a a background image to this `Image View`. 

Change the `View -> Content Mode` attribute of this component from `Aspect Fit`(Default, keeps original aspect ratio) to `Scale to Fill` (stretch to fill the entire component area). `Aspect to Fill` option keeps the original aspect ratio wile sacling it to fit the entire Image View. 

Put a new `Image View` to the upper middle of screen and put logo there. 

Put a new `Image View` on canvas, and resize it to 120p by 120p. Put Dice1 image in there. In the components pane for the storyboard, click on this Image View component, click `ctrl + c` to copy it, then `ctrl + v` to paste it so it is duplicated. Align these two components horizontaly on the storyboard, then select both of them on the component pane, and drag and center as a group in the storyboard. 

Put a `Button` component into canvas, change the `Title` (display name) of the button as "Roll", `Font size` to 30, `Forground` color to white, and `Background` color to be red (to match the dice background red to be consistent. Use `Custom` color and color drop tool to click the right color). 

## Change UI Elements programmatically
Click on the file `ViewController.swift` in the folder view on the left pane, this is where the code should go. 

To visually relate code and UI on storyboard, go to storyboard, and click on the `Adjust Editor Option` icon that shapes like a multi-deck hamburger, and check `Asistant` view. So the UI builder (storyboard) and the code is side by side. 

In order to be able to refer to specifit UI element on the UI builder, need to create an `Interface Builder outlet` (`IB outlet`): hold down `control` button of keyboard and `drag` the UI element to the code file. Drop the DiceOne Image View elem as the first line in the UIViewController class. Then a window will pop up, asking for the `name` of the connection, this will be the name used in the code file to refer to this Image View element in UI builder. Name it "diceImageView1", and click `Connect`. (This is camel casing naming convention). Then you can see this line of code is inserted in the code: `@IBOutlet weak var diceImageView1: UIImageView!`. 

Note: when we drag and drop elements from UI to code, there are codes created in side the storyboard (you can right-click it in left folder pane and select "Open As" -> "Source Code" to view its contents).

If you accidentally changed the name of `diceImageView1` inside the `@IBOutlet weak var diceImageView1: UIImageView!` in the code, there will be an "this class is not key value coding-compliant for the key diceImageView1" error when you run the app. Solution is to right click on the element in the UI, and click on the cross sign ✖️ preceeding the "View Controller" to delete this connection, and in the code file, click the circle in front of the corresponding line and drag and drop it back to the element in UI builder. 

In the future, if you want to `rename the connection`, the best way is to click on the name in the code, and click on Refactor -> Rename... This change will make the new name to be applied to everywhere this name is used. 

When you hover the circle proceeding the row `@IBOutlet weak var diceImageView1: UIImageView!` in the code, you can see that the corresponding UI element is highlighted on the storyboard. 

Now we can use this name and change the behavior of this Image View element, by modifying what is inside the `viewDidLoad {}` function. 

The functionality we want to add is to change the image of this Image View element when the view loads up, using the dot notation: `who.what = value`. To look for the exact name of this `what`, click on the element in the UI builder, and see it's attributes names in the right panel. 

If on load up, you want to change the image inside this Image View into DiceSix image, then add a new line `diceImageView1.image = UIImage (named: "DiceSix")` into the function so it becomes:
``` 
override func viewDidLoad() {
    super.viewDidLoad()
    diceImageView1.image = UIImage (named: "DiceSix")
}
```

Similarly, if want to change the alpha (aka transparency) of this Image View element, add this line of code: `diceImageView1.alpha = 0.5`, and the function becomes:
``` 
override func viewDidLoad() {
    super.viewDidLoad()
    diceImageView1.image = UIImage (named: "DiceSix")
    diceImageView1.alpha = 0.5
}
```

Similarly, connect code with the second Image View, and the class now looks like this:
```
class ViewController: UIViewController {
    
    // IB outlets allows for referencing UI elements from code
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //   who       what          value
        diceImageView1.image = UIImage (named: "DiceSix")
        // diceImageView1.alpha = 0.5
        diceImageView2.image = UIImage (named: "DiceTwo")
    }
}
```












