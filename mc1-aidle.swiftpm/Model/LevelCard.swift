//
//  LevelCard.swift
//  mc1-aidle
//
//  Created by byo on 2023/03/30.
//

import Foundation

class LevelCard: NarrativeSceneable, ContinuousNarrativeSceneable, AudioNarrativeSceneable {
    let firstImageKey: String
    let secondImageKey: String
    let audioKey: String?
    let nextScene: NarrativeSceneable?
    
    init(firstImageKey: String,
         secondImageKey: String,
         audioKey: String? = "캐릭터카드등장",
         nextScene: NarrativeSceneable?) {
        self.firstImageKey = firstImageKey
        self.secondImageKey = secondImageKey
        self.audioKey = audioKey
        self.nextScene = nextScene
    }
}
