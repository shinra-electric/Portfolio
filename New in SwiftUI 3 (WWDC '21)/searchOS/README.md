# searchOS

This app contains some information about all versions of macOS. It's purpose is demonstrates several new features in SwiftUI 3.

### Search

SwiftUI now has a native search view modifier which is extremely easy to implement. In this app it simply filters the list. There are also search suggestions, but for this use-case filtering is sufficient.  

### Material visual effect

The material effect can be applied as a background, and will give that frosted-glass effect allowing colour in the background to bleed through to the foreground slightly. There are several opacities from .ultraThinMaterial to .ultraThickMaterial. It is now also simple to apply shapes such as rounded corners to the background.
In addition to this, if foregroundtext is given the .secondary, .tertiary and .quaternary values, the text can now receive some of this colour bleed also. 

### Bonus

Although dark mode is not strictly a new feature, the background images and icons will change with the system setting from Mojave onwards. The material effect will also change, along with the accent color of the navigation. 


![](searchOS.mov)



The JSON decoder was borrowed from Paul Hudson at [Hacking With Swift](https://www.hackingwithswift.com/example-code/system/how-to-decode-json-from-your-app-bundle-the-easy-way)