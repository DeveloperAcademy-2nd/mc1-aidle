//
//  StoryScene+Sample.swift
//  mc1-aidle
//
//  Created by byo on 2023/03/30.
//

import Foundation

extension StoryScene {
    enum Sample {
        static let hi = GeneralStoryScene(
            image: ImageData(key: "sample_너굴맨"),
            script: "안녕하세요~",
            nextScene: StoryScene.Sample.general
        )
        
        static let general = GeneralStoryScene(
            image: ImageData(key: "sample_회의"),
            speaker: Learner.byo,
            script: "일반적인 장면은 GeneralStoryScene 클래스로 만들 수 있어요.",
            nextScene: StoryScene.Sample.selection
        )
        
        static let selection = SelectionStoryScene(
            speaker: Learner.byo,
            script: "SelectionStoryScene 클래스는 선택지가 있는 장면을 위해 사용됩니다.\n이해가 좀 되시나요?",
            options: [
                .init(
                    text: "이해 됐어요.",
                    nextScene: StoryScene.Sample.image),
                .init(
                    text: "이해가 안됐어요.",
                    nextScene: StoryScene.Sample.teammatesCantUnderstand
                )
            ]
        )
        
        static let teammatesCantUnderstand = GeneralStoryScene(
            speaker: ExtraSpeaker.teamMembers,
            script: "이해가 안돼요~~",
            nextScene: StoryScene.Sample.thenAskUs
        )
        
        static let thenAskUs = GeneralStoryScene(
            speaker: Learner.ddan,
            script: "그러면 테크팀에 물어보세요~",
            nextScene: StoryScene.Sample.image
        )
        
        static let image = ImageStoryScene(
            image: ImageData(key: "sample_image"),
            nextScene: StoryScene.Sample.ending
        )
        
        static let ending = EndingStoryScene(
            image: ImageData(key: "sample_thanks", isGif: true),
            audioKey: "불타는소리",
            speaker: Learner.byo,
            script: "EndingStoryScene 클래스는 하나의 이야기가 끝나고, 다른 챕터로 넘어가거나 특수한 장면을 보여줘야 할 때 사용됩니다.",
            nextScene: LevelCard.Sample.juju
        )
    }
}
