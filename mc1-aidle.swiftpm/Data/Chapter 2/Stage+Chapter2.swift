//
//  File 3.swift
//  
//
//  Created by 권현우 on 2023/03/30.
//

import Foundation

extension Stage {
    enum Byo {
        static let first = Stage(
            stageNum: "Chapter 2",
            title: "스크래치",
            titleImageKey: "stage2Image",
            nextScene: StoryScene.Byo.cover
        )
    }
}
