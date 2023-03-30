//
//  LevelCard+Sample.swift
//  mc1-aidle
//
//  Created by byo on 2023/03/30.
//

import Foundation

extension LevelCard {
    enum Sample {
        static let juju = LevelCard(
            firstImageKey: "lv1juju",
            secondImageKey: "lv2juju",
            nextScene: Stage.Sample.second
        )
    }
}
