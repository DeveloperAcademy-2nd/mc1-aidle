//
//  File.swift
//  
//
//  Created by 권현우 on 2023/03/30.
//

import Foundation

extension StoryScene {
    enum Byo {
        static let cover = SelectionStoryScene(
            image: ImageData(key: "2byo"),
            speaker: Learner.byo,
            script: "어떤 눈치 없는 사람이 첫날부터 회식을 하자고 해서 회식을 하게 되었다.\n\n아...**...지금까지 다 어사고 내 차에 다 못타는데...",
            options: [
                .init(
                    text: "다같이 제 차 타고 가시죠!",
                    nextScene: StoryScene.Byo.selection1
                ),
                .init(
                    text: "저는 먼저 차타고 갈게요!",
                    nextScene: nil
                )
            ]
        )
        
        static let selection1 = SelectionStoryScene(
            image: ImageData(key: "car01"),
            audioKey: "고민할때",
            speaker: Learner.byo,
            script: "너무 좁아보이는데...",
            options: [
                .init(
                    text: "그냥 주차한다 (성공률 5%)\n(성공시 팀원들의 환호를 받는다.)",
                    nextScene: jdd
                ),
                .init(
                    text: "포기하고 다른 곳을 찾는다.",
                    nextScene: nil
                )
            ]
        )
        
        static let jdd = GeneralStoryScene(
            image: ImageData(key: "car02"),
            audioKey: "끼익",
            script: "끼이익 (돈 나가는 소리)",
            nextScene: StoryScene.Byo.runorpay
        )
        
        static let runorpay = SelectionStoryScene(
            speaker: Learner.byo,
            script: "...",
            options: [
                .init(
                    text: "차주에게 연락한다.",
                    nextScene: nil
                ),
                .init(
                    text: "튄다 (도망쳐 도망쳐)",
                    nextScene: ckck
                )
            ]
        )
        
        static let ckck = GeneralStoryScene(
            image: ImageData(key: "usami"),
            audioKey: "철컹",
            script: "철컹철컹",
            nextScene: StoryScene.Byo.runorpay2
        )
        
        static let runorpay2 = SelectionStoryScene(
            image: ImageData(key: "incar02"),
            speaker: Learner.byo,
            script: "...",
            options: [
                .init(
                    text: "차주에게 연락한다.",
                    nextScene: sibal
                ),
                .init(
                    text: "튄다 (도망쳐 도망쳐)",
                    nextScene: nil
                )
            ]
        )
        
        static let runorpay2 = SelectionStoryScene(
            image: ImageData(key: "incar02"),
            speaker: Learner.byo,
            script: "...",
            options: [
                .init(
                    text: "차주에게 연락한다.",
                    nextScene: sibal
                ),
                .init(
                    text: "튄다 (도망쳐 도망쳐)",
                    nextScene: nil
                )
            ]
        )
        
        static let sibal = EndingStoryScene(
            speaker: Learner.byo,
            script: "하하호호...하하하...하하...씨*",
            nextScene: LevelCard.Byo.byo
        )
    }
}
