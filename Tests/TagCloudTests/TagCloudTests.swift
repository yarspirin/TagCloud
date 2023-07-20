import XCTest
import SwiftUI
@testable import TagCloud

fileprivate struct Tag {
  let num: Int
  let id = UUID()
}

final class TagCloudTests: XCTestCase {
  func testFlowLayoutViewCreation() {
    let tags = (1 ... 5).map { Tag(num: $0) }
    let flowLayoutView = TagCloudView(data: tags) { tag in
      Text("\(tag.num)")
    }
    XCTAssertNotNil(flowLayoutView)
  }
  
  func testTagCloudViewCreation() {
    let tagCloudView = TagCloudView(tags: ["Hello", "World", "I", "love", "Swift"])
    XCTAssertNotNil(tagCloudView)
  }
}
