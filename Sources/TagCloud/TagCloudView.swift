//
//  TagCloudView.swift
//  
//
//  Created by Yaroslav Spirin on 19.07.2023.
//

import SwiftUI

public struct TagCloudView<Data, Content>: View where Data: RandomAccessCollection, Content: View, Data.Index: Hashable {
  private enum TagContent {
    case `default`(DefaultTagContentConfiguration)
    case custom(CustomTagContentConfiguration)
  }
    
  private struct DefaultTagContentConfiguration {
    let tags: [String]
    let textColor: Color
    let foregroundColor: Color
    let borderWidth: CGFloat
    let borderColor: Color
    let cornerRadius: CGFloat
  }
  
  private struct CustomTagContentConfiguration {
    let data: Data
    let verticalSpacing: CGFloat
    let horizontalSpacing: CGFloat
    let content: (Data.Element) -> Content
  }
  
  private let tagContent: TagContent
  
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

extension TagCloudView where Data == [String], Content == TagView {
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
