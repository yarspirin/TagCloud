# TagCloud 🏷️

**TagCloud** is a powerful, flexible and stylish package for integrating tag clouds into your iOS apps. From basic setups to fully customizable collections with your custom views, **TagCloud** provides an intuitive interface that blends seamlessly with SwiftUI's design paradigms.

## 🚀 Features

- **Effortless Integration**: Set up your tag cloud with a single line of code using the default `TagCloudView`.
- **Fully Customizable**: Use any data type that conforms to `RandomAccessCollection` and create your own custom views.
- **Automatic Resizing**: Flow layout for optimal use of space that automatically adjusts as tags are added or removed.
- **Stylish and Modern**: Built entirely with SwiftUI for modern and stylish UIs.

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

<div align="center">
  <img src="https://raw.githubusercontent.com/mountain-viewer/TagCloud/master/Resources/default_example.png" alt="Default Example" width="500">
</div>


### 🔨 Custom `TagCloudView`

For more advanced usage, **TagCloud** allows you to fully customize the tag cloud. You can provide your own collection of data and a closure to generate custom views from your data:

```swift
import SwiftUI
import TagCloud

struct SelectableTag: View {
  @State var isSelected = false
  let title: String
  
  var body: some View {
    Button {
      isSelected.toggle()
    } label: {
      Text(title)
        .foregroundColor(isSelected ? .white : .black)
        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
        .background(
          RoundedRectangle(cornerRadius: 10)
            .foregroundColor(isSelected ? .black : .white)
        )
        .overlay(
          RoundedRectangle(cornerRadius: 10)
            .stroke(isSelected ? .white : .black, lineWidth: 1)
        )
    }
  }
}

struct CustomExampleView: View {
  let titles = ["Hello", "World", "I", "Love", "Swift", "And", "Tag", "Clouds"]
  
  var body: some View {
    TagCloudView(data: titles) { title in
      SelectableTag(title: title)
    }
  }
}
```

<div align="center">
  <img src="https://raw.githubusercontent.com/mountain-viewer/TagCloud/master/Resources/custom_example.gif" alt="Custom Example" width="500">
</div>

## 💼 Contributing

We love contributions! Whether it's fixing bugs, improving documentation, or proposing new features, your efforts are welcome.


## 📄 License

**TagCloud** is available under the MIT license. See the LICENSE.md file for more info.
