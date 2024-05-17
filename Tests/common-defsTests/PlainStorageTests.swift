import XCTest
@testable import common_defs

final class PlainStorageTests: XCTestCase {
    func testExample() throws {
      let audioStorage = AudioStorage("some.key")
      
      let book = MediaItem(name: "name", id: "id", type: "type")
      let track = MediaItem(name: "name", id: "id")
      
      try audioStorage.saveBook(book: book, track: track)
      
      let loadedBook = try audioStorage.loadBook()
      
      print(loadedBook ?? "unknown")
    }
}
