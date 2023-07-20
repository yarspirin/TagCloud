//
//  FlowLayoutView.swift
//  
//
//  Created by Yaroslav Spirin on 19.07.2023.
//

import SwiftUI

struct FlowLayoutView<Data, Content>: View where Data: RandomAccessCollection, Content: View, Data.Index: Hashable {
  @State private var height: CGFloat = .zero
  
  private let data: Data
  private let verticalSpacing: CGFloat
  private let horizontalSpacing: CGFloat
  private let content: (Data.Element) -> Content
  
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
  
  var body: some View {
    GeometryReader { geometry in
      content(in: geometry)
    }
    .frame(height: height)
  }
  
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
