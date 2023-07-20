//
//  TagCloudView.swift
//  
//
//  Created by Yaroslav Spirin on 19.07.2023.
//

import SwiftUI

/// `TagCloudView` is a SwiftUI view that displays a collection of items as a tag cloud.
///
/// This view is generic over two types: the type of the data that the tags represent (`Data`), and
/// the type of the view that represents each tag (`Content`). The data collection must conform to
/// `RandomAccessCollection` with `Hashable` indices, and the tag view must conform to `View`.
///
/// Example usage:
/// ```
/// TagCloudView(data: ["Hello", "SwiftUI", "Tag", "Cloud"]) { tag in
///   Text(tag)
/// }
/// ```
public struct TagCloudView<Data, Content>: View where Data: RandomAccessCollection, Content: View, Data.Index: Hashable {
  /// The representation of tag's content.
  private enum TagContent {
    /// The default tag content configuration.
    case `default`(DefaultTagContentConfiguration)
    /// The custom tag content configuration.
    case custom(CustomTagContentConfiguration)
  }
    
  /// The default tag content configuration.
  private struct DefaultTagContentConfiguration {
    /// The collection of tag strings.
    let tags: [String]
    /// The color of the tag's text.
    let textColor: Color
    /// The background color of the tag.
    let foregroundColor: Color
    /// The width of the tag's border.
    let borderWidth: CGFloat
    /// The color of the tag's border.
    let borderColor: Color
    /// The corner radius of the tag.
    let cornerRadius: CGFloat
  }
  
  /// The custom tag content configuration.
  private struct CustomTagContentConfiguration {
    /// The collection of data items that the tags represent.
    let data: Data
    /// The spacing between tags vertically.
    let verticalSpacing: CGFloat
    /// The spacing between tags horizontally.
    let horizontalSpacing: CGFloat
    /// A closure that converts a data item into a tag view.
    let content: (Data.Element) -> Content
  }
  
  /// The tag content.
  private let tagContent: TagContent
  
  /// Creates a new `TagCloudView` with the given data and tag view constructor.
  ///
  /// - Parameters:
  ///   - data: The collection of data items that the tags represent.
  ///   - verticalSpacing: The spacing between tags vertically. Defaults to 4.
  ///   - horizontalSpacing: The spacing between tags horizontally. Defaults to 4.
  ///   - content: A closure that converts a data item into a tag view.
  public init(
    data: Data,
    verticalSpacing: CGFloat = 4,
    horizontalSpacing: CGFloat = 4,
    @ViewBuilder content: @escaping (Data.Element) -> Content
  ) {
    self.tagContent = .custom(
      CustomTagContentConfiguration(
        data: data,
        verticalSpacing: verticalSpacing,
        horizontalSpacing: horizontalSpacing,
        content: content)
    )
  }
  
  /// The body of the `TagCloudView`.
  public var body: some View {
    switch tagContent {
    case .custom(let configuration):
      FlowLayoutView(
        data: configuration.data,
        verticalSpacing: configuration.verticalSpacing,
        horizontalSpacing: configuration.horizontalSpacing,
        content: configuration.content
      )
    case .default(let configuration):  
      FlowLayoutView(data: configuration.tags) { tag in
        TagView(
          tag: tag,
          textColor: configuration.textColor,
          foregroundColor: configuration.foregroundColor,
          borderWidth: configuration.borderWidth,
          borderColor: configuration.borderColor,
          cornerRadius: configuration.cornerRadius
        )
      }
    }
  }
}

/// Extension to provide a simpler initializer for `TagCloudView` when the data is an array of strings,
/// and the tag view is a `TagView`.
extension TagCloudView where Data == [String], Content == TagView {
  /// Creates a new `TagCloudView` with the given tag strings and style.
  ///
  /// - Parameters:
  ///   - tags: The collection of tag strings.
  ///   - textColor: The color of the tag's text. Defaults to black.
  ///   - foregroundColor: The background color of the tag. Defaults to white.
  ///   - borderWidth: The width of the tag's border. Defaults to 1.
  ///   - borderColor: The color of the tag's border. Defaults to black.
  ///   - cornerRadius: The corner radius of the tag. Defaults to 10.
  public init(
    tags: [String],
    textColor: Color = .black,
    foregroundColor: Color = .white,
    borderWidth: CGFloat = 1,
    borderColor: Color = .black,
    cornerRadius: CGFloat = 10
  ) {
    self.tagContent = .default(
      DefaultTagContentConfiguration(
        tags: tags,
        textColor: textColor,
        foregroundColor: foregroundColor,
        borderWidth: borderWidth,
        borderColor: borderColor,
        cornerRadius: cornerRadius
      )
    )
  }
}
