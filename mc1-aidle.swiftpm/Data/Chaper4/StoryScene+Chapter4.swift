//
//  File.swift
//  
//
//  Created by been on 2023/03/30.
//

import Foundation

extension StoryScene {
    enum StoryScene4 {
        
        static let afml = GeneralStoryScene(
            image: ImageData(key: "aFML"),
            audioKey: "스폰지밥",
            script: "발표 하루 전",
            nextScene: StoryScene.StoryScene4.pizzaCall
        )
        
        static let pizzaCall = GeneralStoryScene(
            image: ImageData(key: "tired"),
            speaker: Learner.jake,
            script: "계속되는 작업으로 팀원들이 지쳤고 딴은 농담으로 나한테 피자를 사달라고 한다. \n하지만 나는 통장잔고 부족으로 인해 무지출 챌린지를 하는 중이다.",
            nextScene: StoryScene.StoryScene4.pizzaGoldenBell
        )
        
        static let pizzaGoldenBell = SelectionStoryScene(
            speaker: Learner.jake,
            script: "계속되는 작업으로 팀원들이 지쳤고 딴은 농담으로 나한테 피자를 사달라고 한다. \n하지만 나는 통장잔고 부족으로 인해 무지출 챌린지를 하는 중이다.",
            options: [
                .init(
                    text: "사기 진작을 위해 피자를 쏜다.",
                    nextScene: StoryScene.StoryScene4.noMoney
                ),
                .init(
                    text: "못들은 척하고 딴을 손절한다.",
                    nextScene: StoryScene.StoryScene4.noMoney
                )
            ]
        )
        
        static let noMoney = GeneralStoryScene(
            image: ImageData(key: "tired"),
            speaker: Learner.jake,
            script: "당장 통장에 돈이 없으니 돈을 마련해야 된다.",
            nextScene: StoryScene.StoryScene4.moneyHow
        )
        
        static let moneyHow = SelectionStoryScene(
            speaker: Learner.jake,
            script: "당장 통장에 돈이 없으니 돈을 마련해야 된다.",
            options: [
                .init(
                    text: "카뱅 금리 7.63% 비상금 마통을 땡긴다.",
                    nextScene: StoryScene.StoryScene4.theGlory
                ),
                .init(
                    text: "분당 집을 판다.",
                    nextScene: StoryScene.StoryScene4.theGlory
                ),
                .init(
                    text: "오늘 상 쳤으니 주식 일부를 판다.",
                    nextScene: StoryScene.StoryScene4.theGlory
                )
            ]
        )
        
        static let theGlory = GeneralStoryScene(
            image: ImageData(key: "2jake"),
            audioKey: "멋지다연진아",
            speaker: Learner.jake,
            script: "비록 통장 잔고는 처참하지만... 야근.. 할 수 있겠지? 그래.. 그거면 된 거야... 멋지다 (A)I-dle!",
            nextScene: StoryScene.StoryScene4.workHard
        )
        
        static let workHard = GeneralStoryScene(
            image: ImageData(key: "desk06"),
            speaker: Learner.jake,
            script: "피자를 먹은 후 각자의 위치에서 열일중인 아이들.",
            nextScene: StoryScene.StoryScene4.nowMessy
        )
        
        static let nowMessy = GeneralStoryScene(
            image: ImageData(key: "desk06"),
            speaker: Learner.ddan,
            script: "쥬쥬는 멀티가 안되서 아무리 불러도 대답이 없다 (ㄹㅇ 노답) 난 테크인데 코딩을 할 수 없다 (역시 🐶노답) 뭘 해야하지..? (테오만 혼자 뺑이 치는 각인데...)",
            nextScene: StoryScene.StoryScene4.ddanChoice
        )
        
        static let ddanChoice = SelectionStoryScene(
            speaker: Learner.ddan,
            script: "쥬쥬는 멀티가 안되서 아무리 불러도 대답이 없다 (ㄹㅇ 노답) 난 테크인데 코딩을 할 수 없다 (역시 🐶노답) 뭘 해야하지..? (테오만 혼자 뺑이 치는 각인데...)",
            options: [
                .init(
                    text: "테오가 너무 바빠보인다. 도와줘야..겠지?",
                    nextScene: LevelCard.Stage4.ddan
                ),
                .init(
                    text: "조용히 가위질을 하며 버스를 탄다",
                    nextScene: LevelCard.Stage4.ddan
                )
            ]
        )
        
        static let suriSuri = GeneralStoryScene(
            image: ImageData(key: "harry"),
            audioKey: "해리",
            speaker: Learner.suri,
            script: "해리스타일스 공연을 보고 왔더니 내가 발표자로 지목되었다.. 인생의 발표는 모두 피해왔는데...",
            nextScene: StoryScene.StoryScene4.suriChoice
        )
        
        static let suriChoice = SelectionStoryScene(
            image: ImageData(key: "harry"),
            speaker: Learner.suri,
            script: "해리스타일스 공연을 보고 왔더니 내가 발표자로 지목되었다.. 인생의 발표는 모두 피해왔는데...",
            options: [
                .init(
                    text: "조용히 발표를 맡는다.",
                    nextScene: StoryScene.StoryScene4.ending4
                ),
                .init(
                    text: "단호하게 인생의 여정을 들려준다.",
                    nextScene: StoryScene.StoryScene4.ending4
                )
            ]
        )
        
        static let ending4 = EndingStoryScene(
            image: ImageData(key: "presentation", isGif: false),
            script: "발표는 쥬쥬와 테오가 맡게 되었다.",
            nextScene: LevelCard.Stage4.juju
        )
    }
}





