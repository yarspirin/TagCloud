//
//  FlowLayoutView.swift
//  
//
//  Created by Yaroslav Spirin on 19.07.2023.
//

import SwiftUI

/// `FlowLayoutView` is a SwiftUI view that arranges its children in a flow layout.
/// A flow layout arranges items in a grid-like format, filling each row before moving on to the next one.
///
/// This view is generic over two types: the type of the data that the tags represent (`Data`), and
/// the type of the view that represents each tag (`Content`). The data collection must conform to
/// `RandomAccessCollection` with `Hashable` indices, and the tag view must conform to `View`.
///
/// Example usage:
/// ```
/// FlowLayoutView(data: ["Hello", "SwiftUI", "Tag", "Cloud"]) { tag in
///   Text(tag)
/// }
/// ```
struct FlowLayoutView<Data, Content>: View where Data: RandomAccessCollection, Content: View, Data.Index: Hashable {
  /// The height of the view. Updated dynamically as subviews are added.
  @State private var height: CGFloat = .zero
  
  /// The collection of data items that the tags represent.
  private let data: Data
  /// The spacing between tags vertically.
  private let verticalSpacing: CGFloat
  /// The spacing between tags horizontally.
  private let horizontalSpacing: CGFloat
  /// A closure that converts a data item into a tag view.
  private let content: (Data.Element) -> Content
  
  /// Creates a new `FlowLayoutView` with the given data and tag view constructor.
  ///
  /// - Parameters:
  ///   - data: The collection of data items that the tags represent.
  ///   - verticalSpacing: The spacing between tags vertically. Defaults to 4.
  ///   - horizontalSpacing: The spacing between tags horizontally. Defaults to 4.
  ///   - content: A closure that converts a data item into a tag view.
  init(
    data: Data,
    verticalSpacing: CGFloat = 4,
    horizontalSpacing: CGFloat = 4,
    @ViewBuilder content: @escaping (Data.Element) -> Content
  ) {
    self.data = data
    self.verticalSpacing = verticalSpacing
    self.horizontalSpacing = horizontalSpacing
    self.content = content
  }
  
  /// The body of the `FlowLayoutView`.
  var body: some View {
    GeometryReader { geometry in
      content(in: geometry)
    }
    .frame(height: height)
  }
  
  /// Provides the content of the `FlowLayoutView`, given the current geometry proxy.
  ///
  /// This method is responsible for arranging the children in a flow layout, adjusting their positions
  /// as needed to fit within the available space.
  private func content(in geometry: GeometryProxy) -> some View {
    ZStack {
      var offset = CGSize.zero
      ForEach(data.indices, id: \.self) { index in
        content(data[index])
          .padding(.vertical, verticalSpacing)
          .padding(.horizontal, horizontalSpacing)
          .alignmentGuide(HorizontalAlignment.center) { dimension in
            if offset.width + dimension.width > geometry.size.width {
              offset.width = 0
              offset.height += dimension.height
            }
            
            let result = offset.width
            offset.width += dimension.width
            
            if data.index(after: index) == data.endIndex {
              offset.width = 0
            }
            
            return -result
          }
          .alignmentGuide(VerticalAlignment.center) { dimension in
            let result = offset.height
            
            if data.index(after: index) == data.endIndex {
              offset.height = 0
            }
            
            return -result
          }
      }
    }
    .background(readHeight(to: $height))
  }
  
  /// Reads the height of the given geometry proxy and updates the `height` state property.
  ///
  /// This method uses a background `GeometryReader` to measure the height of the view's content
  /// and update the `height` property.
  private func readHeight(to binding: Binding<CGFloat>) -> some View {
    GeometryReader { geometry -> Color in
      let rect = geometry.frame(in: .local)
      
      DispatchQueue.main.async {
        binding.wrappedValue = rect.size.height
      }
      
      return .clear
    }
  }
}
