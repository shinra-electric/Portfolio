# searchOS

This app contains some information about all the different versions of macOS. It's purpose is to demonstrate several new features in SwiftUI 3.

### Search

SwiftUI now has a native search view modifier which is extremely easy to implement. In this app it simply filters the list. There is also a new search suggestions feature, but for this use-case filtering is a better fit.  

### Material visual effect

The material effect can be applied as a background, and will give that frosted-glass effect allowing colour in the background to bleed through to the foreground slightly. There are several opacities from .ultraThinMaterial to .ultraThickMaterial. It is now also simple to apply shapes such as rounded corners to the background.
In addition to this, if foreground text is given the .secondary, .tertiary and .quaternary values, the text can now receive some of this colour bleed as well. 

### Swipe actions

Swipe actions can now be easily applied to lists, using standard buttons and labels. They can be set to either leading or trailing sides, and can be coloured. Can also restrict whether a full swipe is permitted. 
I added in a swipe action to favourite an OS. There is no need for swipe to delete or any other functions for this app though. 

### Bonus

Although dark mode is not really a new feature, the background images and icons will change with the system setting from Mojave onwards. The material effect will also change, along with the accent color of the navigation. 


![](searchOS.mov)



The JSON decoder was borrowed from Paul Hudson at [Hacking With Swift](https://www.hackingwithswift.com/example-code/system/how-to-decode-json-from-your-app-bundle-the-easy-way)
