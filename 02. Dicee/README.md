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

In order to be able to refer to specifit UI element on the UI builder, need to create an `Interface Builder outlet` (`IB outlet`): hold down `control` button of keyboard and `drag` the UI element to the code file. Drop the DiceOne Image View elem as the first line in the UIViewController class. Then a window will pop up, asking for the `name` of the connection, this will be the name used in the code file to refer to this Image View element in UI builder. Name it "diceImageView1", and click `Connect`. (This is camel casing naming convention). Then you can see this line of code is inserted in the code: 
```
@IBOutlet weak var diceImageView1: UIImageView!
```

Note: when we drag and drop elements from UI to code, there are codes created in side the storyboard (you can right-click it in left folder pane and select "Open As" -> "Source Code" to view its contents).

If you accidentally changed the name of `diceImageView1` inside the `@IBOutlet weak var diceImageView1: UIImageView!` in the code, there will be an "this class is not key value coding-compliant for the key diceImageView1" error when you run the app. Solution is to right click on the element in the UI, and click on the cross sign ✖️ preceeding the "View Controller" to delete this connection, and in the code file, click the circle in front of the corresponding line and drag and drop it back to the element in UI builder. 

In the future, if you want to `rename the connection`, the best way is to `right-click` on the name in the code, and click on `Refactor` -> `Rename`... This change will make the new name to be applied to everywhere this name is used. 

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

## Connect button from storyboard to code
Hold on `control` key and drag the "Roll" button below the function viewDidLoad(), the window pop out and shows `Connection` type as `Action` by default - because we usually want button to perform actionns. However, you can select `Outlet` connection type of you want to change its appearance. The default `Event` for this button is `Touch Up Inside`, and there are a lot of Events to choose from. Name the button "rollButtonPressed", and choose the `Type` that triggers the action as `UIButton`. Then click `Connect`. Notice the code that is generated: 
```
@IBAction func rollButtonPressed(_ sender: UIButton) {
}
```

Note that this time an `IBAction` is generated, which is the code that got triggered when the defined action happens. If you put a `print` statement inside this function:
```
@IBAction func rollButtonPressed(_ sender: UIButton) {
    print("Button got tapped. ")
}
```
Now run the app, and tap the "Roll" button. Then we can see the string prints on the console. And this happens every time the button is tapped. 

On a higher level, we can see that `IBOutlet` lets our code to change the UI, while `IBAction` lets our UI to change the code. 

Now if we want to change the dice images when we tap on the button, we need to connect these two things. For example, this will make both image to show DiceFour when the button is clicked:
```
@IBAction func rollButtonPressed(_ sender: UIButton) {
    diceImageView1.image = UIImage (named: "DiceFour")
    diceImageView2.image = UIImage (named: "DiceFour")
}
```

Comment in Swift is same as C: `//` for single line comment, and `/* text */` as mult-line comment. 

## Swift Playground
To play with Swift code, could go to `File` -> `New` -> `Playground...`, then you get a code area and a consol to play with. You can press and hold the second icon in the top bar of the console and click `Automatically Run`. 

`print("Hello \(2+3) World")` will print `Hello 5 World` to the console. This is called `String Interpolation`. 

## Swift Arrays
```
var numbers = [35, 45, 2, 24]
```
Array index start from 0. Now create an array in the function rollButtonPressed: 
```
let diceArray = [UIImage (named: "DiceOne"),
                 UIImage (named: "DiceTwo"),
                 UIImage (named: "DiceThree"),
                 UIImage (named: "DiceFour"),
                 UIImage (named: "DiceFive"),
                 UIImage (named: "DiceSix")];
```

And in the action function, add:
```
diceImageView1.image = diceArray[Int.random(in: 0...5)]
diceImageView2.image = diceArray[Int.random(in: 0...5)]
```
This will allow the two dice images to change randomly when we click the button. 

In Swift, you will have an error if you don't have equal amount of space on the left and right of the equal sign. 


## Swift Variables
```
var number = 1
print("The value of number is \(number).")
```

## Random numbers 
```
Int.random(in: 1 ... 10)  // generate a int number in the range of [1, 10]
Int.random(in: 1 ..< 10)  // generate a int number in the range of [1, 10)
Float.random(in: 1 ... 3) // generate a float number in the range of [1, 3]
Float.random(in: 1 ..< 3) // generate a float number in the range of [1, 3)
Bool.random()             // generate a true or a false
array.shuffle()           // randomise the array
```

## Auto Layout
With `auto layout`, our app's layout can be exactly what we want when the app runs on a different device with different screen size, it can also adapt to portrait and landscapte mode. 

In our current Dice app, in the warning tab in the left pane, it shows "warning: Auto Layout Localization: Views without any layout constraints may clip their content or overlap other views. ". For example, if we switch to landscape mode in the simulator, our "Roll" button has completely disappeared from view. 

If we switch to the "LaunchScreen.storyboard", and switch to landscape orientation in the storyboard view, we can see that the image is cut out and only partially seen. 

### Constraints (Alignments and Pins)
Switch back to portrait mode in storyboard. Adjust the background image size so it fits to all 4 edges. Select the background image in the storyboard. Expand the storyboard pane, so you see a bunch of icons show up in the bottom bar. The third icon from the right allow you to `Add New Constraints`. Make sure all 4 text boxes are all showing 0 (if you click on the drop down for the box, you get to choose to define relative to the safe area or to the view, or to other elements on the board), and click on the 4 red lines to make them change from faded red to bright red. Then click on `Add 4 constraints` button. 

Now if we go to landscape mode, we can see that the background image is more or less fit the screen. If we go to the left panel inside the storyboard panel and click on `Constriants`, we can expand and see all the constainsts that are applied to our UI. We can see that now some constraints are set to the `Safe Area` of the screen. Since `Safe Area` is not the whole part of the screen, we need to set the boundary to the `Super View`, which is the whole screen. If we click on the constraint we want to change, and in the right panel that shows up, choose `Superview` for `Second Item` attribute, then we can see the images streches to cover the whole screen. 

You can also select `Relative to Margin` in the `Second Item` attribute, margin is close to but inside the safe area. 

Now at the bottom bar of the storyboard view, if we choose a different device, or a different orientation, our background image always displays perfectly. 

### Alignments
The next thing in the launch screen that need to be tackled in the logo image. We again need it to be centered for different devices and orientation. You can not use constraints anymore here, because it fixes points so it cannot adapt to landscape mode. Instead, select the logo image view, drag and `center` it on the screen, and click on the 4th icon `Align` from the right bottom bar. In the pop up window, select `Horizontally in Container` and `Vertically in Container` at the bottom, and click `Add 2 constraints`. Now if we switch to landscape mode, the logo is still centered. 

### Pins
Now put a Label element to the screen. select this element, and change its `Align` to `Horizontally in Container`; and its `Constraints` to '30px' below the logo. 

## Work on the App
Now go to the "Main.storyboard" and set constraints for background image to fit to the whole View (click on the drop down to make sure to select relative to the view). 

To constrain the location of the dice logo, the two dice images and the "Roll" button, it is hard pin or align the to center one by one, because some of them are not aligned to the center, and it would be hard to pin them to be adaptive to landscape mode. Now, we would use some `containers` to split up the screen into 3 equal parts, e.g., top, middle and bottom, then we can embed each elements relative to their own containers. 

## Containers
To create a `container`, go to the object library and search for "uiview", and will see the `View` element - drag it to the board. Then to drag our logo inside the view, in the left pane in the storyboard, drag the logo object below the `View` object, so it is `indented` below it. 

Another way to embed objects into a view is to select the objects in the board, then `Editor` -> `Embed in` -> `View` from the menubar.  

The third way to embed objects into a view is to select tht objects in the board, then click on the rightmost icon and select `View` at the bottom bar in the board. 

Now all 3 containers have the same name, to differentiate them, rename it by selecting the view in the left pane, then click agian on its name, and type "Top View". An alternative way to do this is to select the view, and on the right pane, select the `identity inspector` tab, and under the `Document` section, change the name of the `Label` field. After renaming, you can reorder the three containers by dragging and dropping. 

Now resize and align them roughly vertically so they look alined well. We need to give constrains to parent before giving constraints of its children relative to their parent. 

## Stack Views
Select all 3 containers, and go to the menu `Editor` -> `Embed in` -> `Stack View`, or select the last icon in the bottom bar in the board, and click `Stack View`, now we can see all three views now sits in a `Stack View` in the left panel. 

Next, we need to give the `Stack View` some constraints relative to its parent (superview). Now resize the stack view to its four edges so they align with the "safe area", then add 4 restraints and make sure the drop down says they are respective to "safe area". 

Note that if your stack view exceed the range of the safe area on the board, then safe area option will not show up in the drop down menu. You need to adjust and drag it in range first. You can alway fine tune any one of the constraints by selecting it in the left pane, and go to `Attributes inspector` tab in the right pane, and set the `Constant` field to 0, and `Second item` to `Safe Area`.

Now we need to adjust things inside the `Stack View`. Because we originally roughly aligned the 3 views inside it vertically to each other, when you select the `Stack View` and inspect its attributes in the right pane, it automatically sets the `Axis` field to `Vertical`. Next, we change the `Distribution` field to `Fill Equally`, because we want all 3 views inside to have equal heights along the vertical axis. Set the `Spacing` field to 0, because we don't want any spacing between 3 views. 

If we change the board to landscape orientation, we can see our constraints are still in place. Now that the parent of each our logo and dice images and the button are already constrained, we can then align the individual elements. Now align the "Roll" button to center in its container. 

To put the two dice images in the middle, we need to put them into a horizontal container. Now select these two, and add them to a `Stack View`. Because originally they are relatively horizontal to each other, so the `Stack View`'s `Axis` field is automatically set to `Horizontal`. Now select this `Stack View`, and align to center relative to its parent, which is the "Middle View". You can also adjust its `Spacing` field to adjust the distance between the two dices. 

The next step is to change the 3 containers to have a transparent background. Select these 3 in the left pane, and change the `Background` field to `Default`. 

Now if we change to landscape view, we can see that all elements are aligned adaptively. 

Our button has shrinked by default to fit the text contents inside the button. This becaue although it is centered in the "Bottom View", it doesn't have any `size constraints`. Now select the button, and click on the third icon from right at the bottom bar, and check the `Width` and/or `Height`, and set values as appropriate. Notice that as soon as we add the constraints, there is a `warning` shows up on the top bar, if we click on it, it shows `Fixed width constraints may cause clipping`. This means that if there are more text than its width, the text will get truncated in the display. Now click the yellow arrow that points rightward in the left pane inside of storyboard, it will show you more detail. Now click on the yellow triangle in the same place, it will show you the solutions. Click on the `Set Constraint to >= Current Width` and click `Confirm`, then the button width will adapt to the contents inside, but also be equal or wider then the specified value. Now if we expand the button object in the left pane, we can see it size constraints. 

## Simulator Settings
To record the Simulator as animated GIF, first hit `command` + `R` to start recording, then after recording is done, click the circle in the top bar, and right-click the window that shows up in the lower right side of the simulator, and select `Save as Animated GIF`. 

Button `style` of `Default` can show click highlights in the Simulator. 

































