//
//  TagView.swift
//  
//
//  Created by Yaroslav Spirin on 19.07.2023.
//

import SwiftUI

/// `TagView` is a SwiftUI view that displays a customizable tag.
///
/// You can customize the tag's text, text color, background color, border width, border color, and corner radius.
///
/// Example usage:
/// ```
/// TagView(tag: "Hello", textColor: .white, foregroundColor: .blue, borderWidth: 2, borderColor: .red, cornerRadius: 10)
/// ```
public struct TagView: View {
  /// The tag's text.
  private let tag: String
  /// The color of the tag's text.
  private let textColor: Color
  /// The background color of the tag.
  private let foregroundColor: Color
  /// The width of the tag's border.
  private let borderWidth: CGFloat
  /// The color of the tag's border.
  private let borderColor: Color
  /// The corner radius of the tag.
  private let cornerRadius: CGFloat
  
  /// Creates a new `TagView`.
  ///
  /// - Parameters:
  ///   - tag: The tag's text.
  ///   - textColor: The color of the tag's text. Defaults to black.
  ///   - foregroundColor: The background color of the tag. Defaults to white.
  ///   - borderWidth: The width of the tag's border. Defaults to 1.
  ///   - borderColor: The color of the tag's border. Defaults to black.
  ///   - cornerRadius: The corner radius of the tag. Defaults to 10.
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
  
  /// The body of the `TagView`.
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
