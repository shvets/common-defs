import Foundation

public protocol Nameable: Hashable, Identifiable {
  var name: String { get set }
}
