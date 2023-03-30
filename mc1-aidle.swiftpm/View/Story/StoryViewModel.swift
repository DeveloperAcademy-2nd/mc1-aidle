//
//  StoryViewModel.swift
//  
//
//  Created by byo on 2023/03/28.
//

import SwiftUI

protocol StoryViewModelDelegate: AnyObject {
    func storyDidEnd(nextScene: NarrativeSceneable?)
}

class StoryViewModel: ObservableObject {
    @Published private var currentScene: StorySceneable? {
        didSet {
            sceneDidSet(currentScene)
        }
    }
    
    @Published private var image: ImageData?
    
    private let audioPlayer: AudioPlayer
    
    weak var delegate: StoryViewModelDelegate?
    
    init(scene: StoryScene,
         audioPlayer: AudioPlayer = .shared) {
        self.currentScene = scene
        self.audioPlayer = audioPlayer
        sceneDidSet(scene)
    }
    
    func getCurrentScene() -> StorySceneable? {
        currentScene
    }
    
    func getImage() -> ImageData? {
        image
    }
    
    func gotoNextScene() {
        switch currentScene {
        case let storyScene as ContinuousStorySceneable:
            withAnimation {
                currentScene = storyScene.nextScene
            }
        case let narrativeScene as ContinuousNarrativeSceneable:
            delegate?.storyDidEnd(nextScene: narrativeScene.nextScene)
        default:
            break
        }
    }
    
    func gotoScene(of option: SelectionStoryScene.Option) {
        guard let nextScene = option.nextScene else {
            return
        }
        withAnimation {
            currentScene = nextScene
        }
    }
    
    private func sceneDidSet(_ scene: StorySceneable?) {
        setImage(scene: scene)
        audioPlayer.stop()
        tryToPlayAudio(scene: currentScene)
    }
    
    private func setImage(scene: StorySceneable?) {
        guard let image = scene?.image else {
            return
        }
        self.image = image
    }
    
    private func tryToPlayAudio(scene: StorySceneable?) {
        guard let audioScene = scene as? AudioNarrativeSceneable,
              let audioKey = audioScene.audioKey else {
            return
        }
        audioPlayer.play(key: audioKey)
    }
}
