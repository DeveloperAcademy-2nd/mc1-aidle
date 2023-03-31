//
//  File.swift
//  
//
//  Created by 예슬 on 2023/03/30.
//

import Foundation

extension StoryScene {
    enum Stage3 {
        
        static let interview = GeneralStoryScene(
            image: ImageData(key: "interview"),
            script: "심층 인터뷰를 하고 온 (A)I-DLE 누군가와 심도 있는 딥톡을 하는 과정에서 자아성찰의 시간을 가졌다.",
            nextScene: StoryScene.Stage3.interview2
        )
        
        static let interview2 = GeneralStoryScene(
            image: ImageData(key: "interview"),
            speaker: Learner.suri,
            script: "우리들의 인터뷰처럼 대부분의 I들은 연결감을 느끼고 싶으나, 연결감을 느끼는 사람 수는 적구나!",
            nextScene: StoryScene.Stage3.analyze
        )
        
        static let analyze = SelectionStoryScene(
            speaker: Learner.suri,
            script: "우리들의 인터뷰처럼 대부분의 I들은 연결감을 느끼고 싶으나, 연결감을 느끼는 사람 수는 적구나!",
            options: [
                .init(
                    text: "그냥 잔다",
                    nextScene: nil
                ),
                .init(
                    text: "피곤하지만 팀원들과 열심히 해석한다",
                    nextScene: LevelCard.Stage3.suri
                )
            ]
        )
        
        static let worry = GeneralStoryScene(
            speaker: ExtraSpeaker.teamMembers,
            script: "그렇다면 우리가 뭘 해야하지?",
            nextScene: StoryScene.Stage3.sticker
        )
        
        static let sticker = GeneralStoryScene(
            image: ImageData(key: "balanceGame1"),
            script: "스티커판 설문을 진행하기로 했지만 사람들에게 다가가기 조차 힘든 (A)I-DLE...",
            nextScene: StoryScene.Stage3.brave
        )
        
        static let brave = SelectionStoryScene(
            speaker: Learner.theo,
            script: "...",
            options: [
                .init(
                    text: "화장실로 도망가서 잠수탄다.",
                    nextScene: nil
                ),
                .init(
                    text: "팀원들과 함께니까 용기내서 말을 걸어본다.",
                    nextScene: StoryScene.Stage3.result
                )
            ]
        )
        
        static let result = EndingStoryScene(
            image: ImageData(key: "balanceGame2"),
            speaker: Learner.theo,
            script: "무려 80명 러너의 설문 참여...! 아카데미에 생각보다 내향인이 많고 정서적 교류가 우선인 사람들이 많은걸! 이것 참 대박인걸 하하",
            nextScene: LevelCard.Stage3.theo
        )
        
    }
}
