//
//  File.swift
//  
//
//  Created by 예슬 on 2023/03/30.
//

import Foundation

extension LevelCard {
    enum Stage3 {
        static let suri = LevelCard(
            firstImageKey: "lv1suri",
            secondImageKey: "lv2suri",
            nextScene: StoryScene.Stage3.worry
        )
        
        static let theo = LevelCard(
            firstImageKey: "lv1theo",
            secondImageKey: "lv2theo",
            nextScene: Stage.Stage4.first4
        )

    }
}
