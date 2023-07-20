//
//  TagCloudView.swift
//  
//
//  Created by Yaroslav Spirin on 19.07.2023.
//

import SwiftUI

public struct TagCloudView: View {
  private let tags: [String]
  private let textColor: Color
  private let foregroundColor: Color
  private let borderWidth: CGFloat
  private let borderColor: Color
  private let cornerRadius: CGFloat
  
  public init(
    tags: [String],
    textColor: Color = .black,
    foregroundColor: Color = .white,
    borderWidth: CGFloat = 1,
    borderColor: Color = .black,
    cornerRadius: CGFloat = 10
  ) {
    self.tags = tags
    self.textColor = textColor
    self.foregroundColor = foregroundColor
    self.borderWidth = borderWidth
    self.borderColor = borderColor
    self.cornerRadius = cornerRadius
  }
  
  public var body: some View {
    FlowLayoutView(data: tags) { tag in
      TagView(
        tag: tag,
        textColor: textColor,
        foregroundColor: foregroundColor,
        borderWidth: borderWidth,
        borderColor: borderColor,
        cornerRadius: cornerRadius
      )
    }
  }
}
