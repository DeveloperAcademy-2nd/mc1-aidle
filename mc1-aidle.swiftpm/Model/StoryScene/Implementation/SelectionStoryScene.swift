//
//  SelectionStoryScene.swift
//  mc1-aidle
//
//  Created by byo on 2023/03/28.
//

import Foundation

final class SelectionStoryScene: StoryScene, DialogStorySceneable {
    let speaker: Speakerable?
    let script: String
    let options: [Option]
    
    init(image: ImageData? = nil,
         audioKey: String? = nil,
         speaker: Speakerable? = nil,
         script: String,
         options: [Option]) {
        self.speaker = speaker
        self.script = script
        self.options = options
        super.init(image: image, audioKey: audioKey)
    }
}

extension SelectionStoryScene {
    final class Option: Identifiable {
        let text: String
        let nextScene: NarrativeSceneable?
        
        init(text: String,
             nextScene: NarrativeSceneable?) {
            self.text = text
            self.nextScene = nextScene
        }
    }
}
