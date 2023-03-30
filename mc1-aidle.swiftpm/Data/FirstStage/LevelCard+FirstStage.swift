//
//  LevelCard+FirstStage.swift
//  mc1-aidle
//
//  Created by byo on 2023/03/30.
//

import Foundation

extension LevelCard {
    enum FirstStage {
        static let juju = LevelCard(
            firstImageKey: "jujuLv1",
            secondImageKey: "jujuLv2",
            audioKey: "캐릭터카드등장",
            nextScene: Stage.Stage3.stage3
        )
    }
}
