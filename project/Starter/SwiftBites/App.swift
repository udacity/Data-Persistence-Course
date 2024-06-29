import SwiftUI

@main
struct SwiftBitesApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environment(\.storage, Storage())
    }
  }
}
