# I am Rich App
## Story
This app comes from something really interesting that happened back in the days when we first had access to the iOS App Store. So there was a guy called Armin Heinrich who created this app called I Am Rich. And the interesting thing was that it's a really simple app, but he charged a whopping $999.99. And all it does is it just displays a single red ruby on the screen, nothing else. And this app that took him probably two seconds to create ended up getting bought by about eight people, some of whom thought it was a joke and they just clicked buy to see what would happen - what happened was that they got charged the full amount and there's a lot of really funny reviews for this app on the App Store.

## Create a new Xcode project from scratch
File -> New -> New Project -> iOS -> App, in the next page, fill in:

| Field | Content |
| ----------- | ----------- |
| Product Name | I am Rich |
| Team | (Login to apple id) |
| Organization Identifier | com.yourcompany.I-am-Rich (Uses Reverse domain name)|
| Interface | Storyboard |
| Language | Swift |

Inside the project folder, the code project is named `I am Rich.Xcodeproj`.


## Navigate the Xcode enviromnent
Click the folder icon `📁` on the upper left corner, and then click on the "`I am Rich`" project which has a blue icon. 

In the middle pane, under `General` tab, Under `Deployment Info` block, you can choose which is the minimum iOS version you want you app to run on. YOu also get to select the checkbox on which device you can run you app on, such as iPhone, iPad, and/or mac. `Device orientation`: which orientation you want you app to be able to display. You also get to choose whether you app hides the status bar (the bar on top of screen that show time and battery status etc.)

The top bar in Xcode in the middle section allow you to choose which device you want to `simulate` your app on. click `▷` on the upper left corner to run your app. 

in the left pane, when you select folder view, it shows all the files that sits in the project subfolder (a folder named by your project) in your project folder. 

The `Main.storyboard` is where you design your app. Click on the `➕` sign in the top bar in the middle pane to add Objects to your storyboard. Can drag and drop to storyboard. 

When you click on an object on the storyboard (or an object in the leftpane - Document Outline in the storyboard pane), the right pane shows various controls for this object. Can change `attributes` (color, font, etc.), `size` (size, location, etc. )

On the left pane, the `ViewController.swift` file is where you code live. The `LaunchScreen.storyboard` is what shows on the screen when your app loads, it only shows for a short period of time. 

At the bottom of the middle pane in the storyboard view, it shows which device you want storyboard to show on. It doesn't have every device, because some devices have the same aspect ratios. You can also change light/dark modes, and orientation of the view. 

When you drag objects (such as a Label component) to storyboard, guidelines will pop up to guide you. 

To change the backgound color, in the middle pane, click the `View` component in the left pane, and change its attributes. To get custom color, need to select `RGB Sliders` in the color pop-up window, and could specify a hex color. 

A website called `colorhunt.co` is a good site to look for colors palettes.

If you have an `app designer`, they will specify where exactly things are placed and how exactly they should look. 

How are `positions` defined? The origin is the upper-left corner of the screen, and Y is the num of `points` tha measures the distance from the screen left edge to the object's left edge. 

If need to look up size of different screens in terms of `points`, which refers to the actual size instead of pixels, go to `paintcodeapp.com/news/ultimate-guide-to-iphone-resolutions`. 

## Steps
Drag an `Label` component to the storyboard and format it as you like. 

Drag an `Image View` component into the storyboard. 

Click on the folder `Assets.xcassets` on the left pane, and drag an diamond image into the blank part of the left panel in the middle pane. Then the image shows up in the middle panel at 1x location. The 3x image is 3 times as large as the 1x image. 

To generate corresponding images of these image sizes, go to `appicon.co`, and click on the `Image Sets` tab, select 3x, and select iOS platform, and drag the diamond image into the box, and click `Generate`. This generates the correct images and named properly. Again drag all 3 of the images and drop them in the white area of Xcode as done before. They will be placed in the right slots accordingly. 

Now if we go to storyboard, select `ImageView`, and can select the diamond image in the attributes tab. Because the image type is png, so it shows the background on the sides. 
 
## App icon
Different sized icons have different uses. To obtain different size images, again go to `appicon.co`, and click on the `App Icon` tab, select iPhone and iPad. Optimally, you need a 1024*1024 image. Go to `canva.com`, and `Create a design`. Download this image you created, and drag it into the blank area of `appicon.co`, and download the zip file of images collection. 

Unzip the file, inside find a `AppIcon.appiconset` folder (which contains all img files and a `Content.json` file, which specifies which img goes into which slot in Xcode), and replace the same folder in the `Assets.xcassets` folder in the app project.

## Run the App
To run on the Xcode Simulator, go to the uppermost bar in Xcode, and choose which device to simulate on, then click on the run button. 



