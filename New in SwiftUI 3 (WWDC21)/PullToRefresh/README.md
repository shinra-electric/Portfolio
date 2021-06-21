#  Pull-To-Refresh and AsyncImage 

SwiftUI got another significant update in WWDC '21, and these apps are to demonstrate some of the new features. 

### Pull-to-refresh for Lists

This feature is quite common in modern apps, and has long been available in UIKit. However the new SwiftUI version uses the new async/await asynchronous features introduced in Swift 5.5 to make it efficient and extremely simple to implement. 
All that is required is to add a .refreshable {  } modifier to a List view. 

### AsyncImage 

This new feature also uses the new async/await feature in Swift 5.5 to load in an image from a remote source (such as a server or the Internet), while displaying a placeholder as the image is loading (or failing to load). The placeholder is also customisable. 
Again, it is trivial to implement in SwiftUI. 

### Markdown support

Also demonstrated in this app is the built-in support for Markdown in Text strings. I have provided the external link 

![](PullToRefresh.mp4)

This app would not be very interesting at all without the genius of [HTTP Cats](https://http.cat).
