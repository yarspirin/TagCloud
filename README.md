# TagCloud 🏷️

**TagCloud** is a powerful, flexible and stylish package for integrating tag clouds into your iOS apps. From basic setups to fully customizable collections with your custom views, **TagCloud** provides an intuitive interface that blends seamlessly with SwiftUI's design paradigms.

## 🚀 Features

- Effortless Integration: Set up your tag cloud with a single line of code using the default`TagCloudView`.
- Fully Customizable: Use any data type that conforms to `RandomAccessCollection` and create your own custom views.
- Automatic Resizing: Flow layout for optimal use of space that automatically adjusts as tags are added or removed.
- Stylish and Modern: Built entirely with SwiftUI for modern and stylish UIs.

## 🔧 Requirements

- iOS 13.0+
- Xcode 14.0+
- Swift 5.7+

## 💻 Installation

Using the Swift Package Manager, add **TagCloud** as a dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/mountainviewer/TagCloud.git", .upToNextMajor(from: "1.0.0"))
]
```

## 🎈 Usage

### 🎯 Default `TagCloudView`

For a quick and beautiful tag cloud, simply provide an array of strings. **TagCloud** will use the default `TagView` to generate a standard tag cloud:

```swift
import SwiftUI
import TagCloud

struct DefaultExampleView: View {
  let tags = ["Hello", "World", "I", "love", "Swift", "and", "tag", "clouds"]
  
  var body: some View {
    TagCloudView(tags: tags)
  }
}
```

### 🔨 Custom `TagCloudView`

For more advanced usage, **TagCloud** allows you to fully customize the tag cloud. You can provide your own collection of data and a closure to generate custom views from your data:

```swift
import SwiftUI
import TagCloud

struct CustomizedExampleView: View {
  let tags = ["Hello", "World", "I", "love", "Swift", "and", "tag", "clouds"]
  
  var body: some View {
    TagCloudView(tags: tags)
  }
}
```

## 💼 Contributing

We love contributions! Whether it's fixing bugs, improving documentation, or proposing new features, your efforts are welcome.


## 📄 License

**TagCloud** is available under the MIT license. See the LICENSE.md file for more info.
