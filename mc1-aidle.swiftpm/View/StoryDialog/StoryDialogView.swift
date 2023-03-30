//
//  StoryDialogView.swift
//  mc1-aidle
//
//  Created by byo on 2023/03/31.
//

import SwiftUI

struct StoryDialogView: View {
    private let scene: DialogStorySceneable
    @State private var fadeInOut = true
    
    private var needsToHideButton: Bool {
        fadeInOut || (scene is SelectionStoryScene)
    }
    
    init(scene: DialogStorySceneable) {
        self.scene = scene
    }
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(spacing: 0) {
                if let speaker = scene.speaker {
                    HStack {
                        Text(speaker.name)
                            .frame(height: 64)
                            .padding(.horizontal, 24)
                            .font(.custom(.dungGeun, size: 30))
                            .background(.white)
                            .border(.black, width: 5)
                            .offset(y: 5)
                        Spacer()
                    }
                }
                
                VStack {
                    Text(scene.script)
                        .font(.custom(.dungGeun, size: 24))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                }
                .padding(32)
                .frame(height: 250)
                .background(
                    Image("layout_dialog")
                        .resizable()
                )
            }
            
            Color.white
                .frame(width: 32, height: 32)
                .offset(x: -24, y: -32)
                .opacity(needsToHideButton ? 1 : 0)
                .onAppear {
                    withAnimation(.easeInOut(duration: 0.5).repeatForever()) {
                        fadeInOut.toggle()
                    }
                }
        }
    }
}

struct StoryDialogView_Previews: PreviewProvider {
    static var previews: some View {
        StoryDialogView(scene: StoryScene.Sample.hi)
    }
}
