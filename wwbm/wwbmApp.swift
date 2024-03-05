
import SwiftUI

@main
struct wwbmApp: App {
    
    @StateObject var mainViewVM = MainScreenViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainView()
            }
                .environmentObject(mainViewVM)
        }
    }
}
