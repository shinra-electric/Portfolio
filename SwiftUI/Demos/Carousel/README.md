# Animated Carousel

This app just displays several film posters, using animation and scale effects to push them into the background when swiping up. 

It demonstrates several new features in SwiftUI 3, and is from a demo by [Kavsoft](https://youtu.be/Wj_PJBWHWUc)

* Note: At the time I was creating this, SwiftUI ScrollView did not support pagination. The original Kavsoft demo uses a custom VerticalCarouselList, which I have included here. However I have also attempted to fix this by using TabView (which does support pagination) and rotate by 90 degrees. This pagination works as expected, but the Opacity does not. So I have left both versions in the code.

![](carousel.mov)






