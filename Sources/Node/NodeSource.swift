public protocol NodeSource {
  associatedtype ID: Equatable
  var id: ID { get }
  var parentID: ID { get }
}
