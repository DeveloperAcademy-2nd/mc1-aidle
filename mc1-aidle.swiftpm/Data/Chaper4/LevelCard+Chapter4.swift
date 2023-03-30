//
//  File.swift
//  
//
//  Created by been on 2023/03/30.
//

import Foundation

extension LevelCard {
    enum Stage4 {
        static let juju = LevelCard(
            firstImageKey: "lv1juju",
            secondImageKey: "lv2juju",
            nextScene: Stage4.theo
        )
        
        static let theo = LevelCard(
            firstImageKey: "lv1theo",
            secondImageKey: "lv2theo",
            nextScene: Ending.cards
        )
    }
}
