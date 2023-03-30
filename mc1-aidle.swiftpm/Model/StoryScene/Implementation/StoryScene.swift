//
//  StoryScene.swift
//  mc1-aidle
//
//  Created by byo on 2023/03/29.
//

import Foundation

class StoryScene: StorySceneable, NarrativeSceneable {
    let image: ImageData?
    
    init(image: ImageData? = nil) {
        self.image = image
    }
}
