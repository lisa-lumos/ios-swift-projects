# 4. Egg Timer App

## Getting Started
To prevent the text in a `Label` component from getting `truncated` due to smaller screen size, there are two ways: 
1. Click on this label in storyboard, and in the right pane of attributes, set the `Lines` attribute to `0`, this will remove the limit to the number of lines inside the Label, and it will `keep the font size`, and create as many lines as needed so it can fit into the Label size. 
3. But if you have too many contents inside the label, it will still overflow. Then you can change the `Autoshrink` property to specify a `minimum font size`. Then it will shrink the font size if it will overflow, and only overflows if it reaches the minimum font size and still have not enough space inside the Label's size. 

In current storyboard, there is a button underneath each egg ImageView, we didn't put image inside buttons because it needs a lot more efforts to make the images fit to correct size. Each button has a Title attribute of either Soft or Medium or Hard, in plain text. Now drag each button so they appear to be on top of their egg image. 

Now create an `IBAction` inside the `UIViewController` class to link all 3 buttons to it. Make sure you choose `Connection` field as `Action`, and `Type` field as `UIButton`. Also, note that it is more precise to use the `Document Outline` pane (aka the left pane) when you drag and drop the circle from code. 



















