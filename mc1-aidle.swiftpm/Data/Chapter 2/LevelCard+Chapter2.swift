//
//  File 2.swift
//  
//
//  Created by 권현우 on 2023/03/30.
//

import Foundation

extension LevelCard {
    enum Byo {
        static let byo = LevelCard(
            firstImageKey: "lv1byo",
            secondImageKey: "lv2byo",
            nextScene: Stage.Stage3.stage3
        )
    }
}
