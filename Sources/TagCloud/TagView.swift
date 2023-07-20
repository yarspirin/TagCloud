//
//  TagView.swift
//  
//
//  Created by Yaroslav Spirin on 19.07.2023.
//

import SwiftUI

public struct TagView: View {
  private let tag: String
  private let textColor: Color
  private let foregroundColor: Color
  private let borderWidth: CGFloat
  private let borderColor: Color
  private let cornerRadius: CGFloat
  
  public init(
    tag: String,
    textColor: Color = .black,
    foregroundColor: Color = .white,
    borderWidth: CGFloat = 1,
    borderColor: Color = .black,
    cornerRadius: CGFloat = 10
  ) {
    self.tag = tag
    self.textColor = textColor
    self.foregroundColor = foregroundColor
    self.borderWidth = borderWidth
    self.borderColor = borderColor
    self.cornerRadius = cornerRadius
  }
  
  public var body: some View {
    Text(tag)
      .foregroundColor(textColor)
      .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
      .background(
        RoundedRectangle(cornerRadius: cornerRadius)
          .foregroundColor(foregroundColor)
      )
      .overlay(
        RoundedRectangle(cornerRadius: cornerRadius)
          .stroke(borderColor, lineWidth: borderWidth)
      )
  }
}
