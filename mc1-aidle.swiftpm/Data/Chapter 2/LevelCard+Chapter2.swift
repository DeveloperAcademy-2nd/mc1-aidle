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
            firstImageKey: "byoLv1",
            secondImageKey: "byoLv2",
            audioKey: "캐릭터카드등장",
            nextScene: Stage.Stage3.stage3
        )
    }
}
