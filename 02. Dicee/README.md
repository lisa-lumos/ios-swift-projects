# 2. Dicee App

The skeleton of this app if cloned from `https://github.com/appbrewery/Dicee-iOS13`.

To find a list of open source iOS apps: `https://github.com/dkhamsing/open-source-ios-apps`

## Build the UI

Go to Storyboard, drag an `Image View` component to create a background image. Resize it to cover the whole screen. Add a a background image to this `Image View`. 

Change the `View -> Content Mode` attribute of this component from `Aspect Fit`(Default, keeps original aspect ratio) to `Scale to Fill` (stretch to fill the entire component area). `Aspect to Fill` option keeps the original aspect ratio wile sacling it to fit the entire Image View. 

Put a new `Image View` to the upper middle of screen and put logo there. 

Put a new `Image View` on canvas, and resize it to 120p by 120p. Put Dice1 image in there. In the components pane for the storyboard, click on this Image View component, click `ctrl + c` to copy it, then `ctrl + v` to paste it so it is duplicated. Align these two components horizontaly on the storyboard, then select both of them on the component pane, and drag and center as a group in the storyboard. 

Put a `Button` component into canvas, change the `Title` (display name) of the button as "Roll", `Font size` to 30, `Forground` color to white, and `Background` color to be red (to match the dice background red to be consistent. Use `Custom` color and color drop tool to click the right color). 

