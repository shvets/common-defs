import common_defs

public class AudioStorage: PlainStorage<AudioInfo> {
  public func saveBook(book: MediaItem, track: MediaItem? = nil) throws {
    let info = AudioInfo(book: book, track: track)

    try save(info)
  }

  public func loadBook() throws -> AudioInfo? {
    try load()
  }
}
