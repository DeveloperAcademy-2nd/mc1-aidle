//
//  Stage+FirstStage.swift
//  mc1-aidle
//
//  Created by byo on 2023/03/30.
//

import Foundation

extension Stage {
    enum FirstStage {
        static let juju = Stage(
            stageNum: "STAGE1",
            title: "숨막히는 첫 만남",
            titleImageKey: "firststage_main",
            nextScene: StoryScene.FirstStage.jujuHi
        )
    }
}
