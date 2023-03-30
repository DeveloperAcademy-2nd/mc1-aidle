//
//  StoryView.swift
//  
//
//  Created by byo on 2023/03/28.
//

import SwiftUI

struct StoryView: View {
    @ObservedObject var viewModel: StoryViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if let image = viewModel.getImage() {
                    imageView(image: image, width: geometry.size.width)
                }
                
                if let scene = viewModel.getCurrentScene() {
                    VStack {
                        if let options = (scene as? SelectionStoryScene)?.options {
                            optionsView(options: options)
                        }
                        
                        Spacer()
                        
                        if let dialogScene = scene as? DialogStorySceneable {
                            dialogView(scene: dialogScene)
                        }
                    }
                }
            }
        }
        .ignoresSafeArea()
        .background(Color.backgroundColor)
    }
    
    private func imageView(image: ImageData, width: CGFloat) -> some View {
        Group {
            if image.isGif {
                if let gifImg = UIImage(named: "\(image.key).gif") {
                    let cgImage = gifImg.cgImage!
                    let width = CGFloat(cgImage.width)
                    let height = CGFloat(cgImage.height)
                    GeometryReader { geometry in
                        let ratio = geometry.size.width / width
                        GifImage(name: image.key)
                            .frame(height: height * ratio)
                    }
                }
                
            } else {
                Image(image.key)
                    .resizable()
                    .scaledToFit()
            }
        }
        .frame(width: width)
        .animation(.easeInOut, value: image)
        .onTapGesture {
            viewModel.gotoNextScene()
        }
    }
    
    private func optionsView(options: [SelectionStoryScene.Option]) -> some View {
        VStack {
            ForEach(options) { option in
                Button {
                    viewModel.gotoScene(of: option)
                } label: {
                    Text(option.text)
                        .multilineTextAlignment(.leading)
                        .font(.custom(.dungGeun, size: 24))
                        .foregroundColor(.black)
                        .padding(.vertical, 24)
                        .padding(.horizontal, 32)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            Image("layout_option")
                                .resizable(
                                    capInsets: EdgeInsets(top: 32, leading: 32, bottom: 32, trailing: 32),
                                    resizingMode: .tile
                                )
                        )
                }
            }
        }
        .padding(.top, 64)
        .padding(.horizontal, 20)
    }
    
    private func dialogView(scene: DialogStorySceneable) -> some View {
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
        .onTapGesture {
            viewModel.gotoNextScene()
        }
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = StoryViewModel(scene: StoryScene.Sample.general)
        return StoryView(viewModel: viewModel)
    }
}
