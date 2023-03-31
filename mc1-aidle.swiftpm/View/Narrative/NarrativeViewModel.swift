//
//  NarrativeViewModel.swift
//  mc1-aidle
//
//  Created by byo on 2023/03/29.
//

import SwiftUI

final class NarrativeViewModel: ObservableObject {
    private let initialScene: NarrativeSceneable
    
    @Published private var currentScene: NarrativeSceneable? {
        didSet {
            sceneDidSet(scene: currentScene)
        }
    }
    
    private let audioPlayer: AudioPlayer
    
    init(scene: NarrativeSceneable,
         audioPlayer: AudioPlayer = .shared) {
        self.initialScene = scene
        self.currentScene = scene
        self.audioPlayer = audioPlayer
        sceneDidSet(scene: scene)
    }
    
    func getCurrentScene() -> NarrativeSceneable? {
        currentScene
    }
    
    private func sceneDidSet(scene: NarrativeSceneable?) {
        audioPlayer.stop()
        tryToPlayAudio(scene: currentScene)
    }
    
    private func tryToPlayAudio(scene: NarrativeSceneable?) {
        guard let audioScene = scene as? AudioNarrativeSceneable,
              let audioKey = audioScene.audioKey else {
            return
        }
        audioPlayer.play(key: audioKey)
    }
}

extension NarrativeViewModel: StageViewModelDelegate {
    func stageDidEnd(nextScene: NarrativeSceneable?) {
        withAnimation {
            currentScene = nextScene
        }
    }
}

extension NarrativeViewModel: ProfileCardViewModelDelegate {
    func profileCardDidEnd() {
        guard let scene = currentScene as? ContinuousNarrativeSceneable else {
            return
        }
        withAnimation {
            currentScene = scene.nextScene
        }
    }
}

extension NarrativeViewModel: StoryViewModelDelegate {
    func storyDidEnd(nextScene: NarrativeSceneable?) {
        withAnimation {
            currentScene = nextScene
        }
    }
}

extension NarrativeViewModel: LevelCardViewDelegate {
    func levelCardDidEnd() {
        guard let scene = currentScene as? ContinuousNarrativeSceneable else {
            return
        }
        withAnimation {
            currentScene = scene.nextScene
        }
    }
}

extension NarrativeViewModel: RestartViewDelegate {
    func restartDidEnd() {
        withAnimation {
            currentScene = StoryScene.Byo.runorpay // initialScene
        }
    }
}
