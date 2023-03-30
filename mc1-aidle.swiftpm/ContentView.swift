import SwiftUI

struct ContentView: View {
    var body: some View {
        narrativeView()
    }
    
    private func narrativeView() -> some View {
        let viewModel = NarrativeViewModel(scene: Stage.FirstStage.juju)
        return NarrativeView(viewModel: viewModel)
    }
}
