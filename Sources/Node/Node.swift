public protocol Node {
  associatedtype ID: Equatable
  associatedtype Source: NodeSource where Source.ID == ID
  
  var id: ID { get }
  var children: [Self] { get set }
  
  init(id: ID)
}

public extension Node {
  mutating func setChildren(sources: [Source]) {
    let foundData = sources.filter { id == $0.parentID }
    children = foundData.map { .init(id: $0.id) }
  }

  mutating func setData(sources: [Source]) {
    for i in children.indices {
      children[i].setChildren(sources: sources)

      children[i].setData(sources: sources)
    }
  }

  mutating func setAllData(sources: [Source]) {
    setChildren(sources: sources)
    setData(sources: sources)
  }
}
