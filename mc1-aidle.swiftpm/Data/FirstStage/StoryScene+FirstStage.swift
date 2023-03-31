//
//  StoryScene+FirstStage.swift
//  mc1-aidle
//
//  Created by byo on 2023/03/30.
//

import Foundation

extension StoryScene {
    enum FirstStage {
        static let jujuHi = GeneralStoryScene(
            image: ImageData(key: "desk01"),
            speaker: Learner.juju,
            script: "안녕하세요?",
            nextScene: FirstStage.noAnswer
        )
        
        static let noAnswer = GeneralStoryScene(
            image: ImageData(key: "desk02"),
            speaker: ExtraSpeaker.teamMembers,
            script: "...",
            nextScene: FirstStage.jujuStart
        )
        
        static let jujuStart = GeneralStoryScene(
            image: ImageData(key: "desk03"),
            audioKey: "불타는소리",
            speaker: Learner.juju,
            script: "시작해볼까요?",
            nextScene: FirstStage.noAnswerAgain
        )
        
        static let noAnswerAgain = GeneralStoryScene(
            image: ImageData(key: "desk04"),
            audioKey: "불꺼지는소리완성",
            speaker: Learner.juju,
            script: "...\n\n(사람들이 아무말도 안한다...)",
            nextScene: FirstStage.jujuWant
        )
        
        static let jujuWant = SelectionStoryScene(
            image: ImageData(key: "2juju"),
            speaker: Learner.juju,
            script: "기획을 해보고 싶긴 했는데...",
            options: [
                .init(
                    text: "댄스 워크숍을 열어서 친해지자",
                    nextScene: nil
                ),
                .init(
                    text: "아무도 안나서니 박력있게 팀을 리드한다",
                    nextScene: FirstStage.jujuWinter
                )
            ]
        )
        
        static let jujuWinter = GeneralStoryScene(
            image: ImageData(key: "2juju"),
            audioKey: "nextlevel",
            speaker: Learner.juju,
            script: "이번 발표로 에스파 신곡 한번 추실래요?\n제가 윈터할게요!",
            nextScene: FirstStage.allYes
        )
        
        static let allYes = GeneralStoryScene(
            image: ImageData(key: "desk06"),
            speaker: ExtraSpeaker.teamMembers,
            script: "ㅇㅇ ~~~ x5",
            nextScene: FirstStage.jujuConfused
        )
        
        static let jujuConfused = SelectionStoryScene(
            image: ImageData(key: "2juju"),
            speaker: Learner.juju,
            script: "왜 다른 의견을 아무도 안내고 다 그저 좋다고만 하지?\n우리 이대로 괜찮은 걸까..",
            options: [
                .init(
                    text: "이렇게 가다가 진짜 망할것같으니 회식을 추진하자",
                    nextScene: LevelCard.FirstStage.juju
                ),
                .init(
                    text: "데이지 섭 미안해요 MC2부터 잘할게요",
                    nextScene: nil
                )
            ]
        )
    }
}
