//
//  NarrativeView.swift
//  mc1-aidle
//
//  Created by byo on 2023/03/29.
//

import SwiftUI

struct NarrativeView: View {
    @ObservedObject var viewModel: NarrativeViewModel
    
    private var currentScene: NarrativeSceneable? {
        viewModel.getCurrentScene()
    }
    
    var body: some View {
        Group {
            switch currentScene {
            case let stage as Stage:
                stageView(stage: stage)
            case let storyScene as StoryScene:
                storyView(scene: storyScene)
            case let levelCard as LevelCard:
                levelCardView(levelCard: levelCard)
            case let ending as Ending:
                endingView()
            default:
                restartView()
            }
        }
    }
    
    private func stageView(stage: Stage) -> some View {
        let viewModel = StageViewModel(stage: stage)
        viewModel.delegate = self.viewModel
        return StageView(viewModel: viewModel)
    }
    
    private func profileView(profile: Profile) -> some View {
        let viewModel = ProfileCardViewModel(profile: profile)
        viewModel.delegate = self.viewModel
        return ProfileCardView(viewModel: viewModel)
    }
    
    private func storyView(scene: StoryScene) -> some View {
        let viewModel = StoryViewModel(scene: scene)
        viewModel.delegate = self.viewModel
        return StoryView(viewModel: viewModel)
    }
    
    private func levelCardView(levelCard: LevelCard) -> some View {
        var view = LevelCardView(
            firstImageKey: levelCard.firstImageKey,
            secondImageKey: levelCard.secondImageKey
        )
        view.delegate = viewModel
        return view
    }
    
    private func endingView() -> some View {
        EndingCards()
    }
    
    private func restartView() -> some View {
        var view = RestartView()
        view.delegate = self.viewModel
        return view
    }
}

struct NarrativeView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = NarrativeViewModel(scene: Stage.Sample.first)
        return NarrativeView(viewModel: viewModel)
    }
}
