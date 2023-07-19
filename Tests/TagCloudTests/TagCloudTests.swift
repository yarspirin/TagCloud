import XCTest
import SwiftUI
@testable import TagCloud

fileprivate struct Tag {
  let num: Int
  let id = UUID()
}

final class TagCloudTests: XCTestCase {
  func testTagCloudViewCreation() {
    let tags = (1 ... 5).map { Tag(num: $0) }
    let tagCloudView = TagCloudView(data: tags) { tag in
      Text("\(tag.num)")
    }
    XCTAssertNotNil(tagCloudView)
  }
}
