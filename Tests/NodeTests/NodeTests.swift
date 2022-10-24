import XCTest
@testable import Node

final class NodeTests: XCTestCase {
  func testExample() throws {
    let inputDatas: [String: String?] = [
      "1": nil,
      "2": "1",
      "3": "2",
      "4": "1",
      "5": "4",
      "6": "5"
    ]
    
    let sources: [TweetNodeSource] = inputDatas.filter { $0.value != nil }.map { .init(id: $0.key, parentID: $0.value!) }
    
    let topNode = inputDatas.first { $0.value == nil }!
    var node: TweetNode = .init(id: topNode.key)
    node.setAllData(sources: sources)
    
    print(node)
    XCTAssertEqual(node, TweetNode(id: "1", children: [.init(id: "2", children: [.init(id: "3")]), .init(id: "4", children: [.init(id: "5", children: [.init(id: "6")])])]))
  }
}

struct TweetNodeSource: NodeSource {
  let id: String
  let parentID: String
}

struct TweetNode: Node, Equatable {
  let id: String
  var children: [TweetNode]
  typealias Source = TweetNodeSource
  
  init(id: String) {
    self.id = id
    self.children = []
  }
  
  init(id: String, children: [TweetNode] = []) {
    self.id = id
    self.children = children
  }
}
