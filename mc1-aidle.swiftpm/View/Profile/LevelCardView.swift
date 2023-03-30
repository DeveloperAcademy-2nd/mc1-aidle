//
//  LevelCardView.swift
//  mc1-aidle
//
//  Created by 박승찬 on 2023/03/30.
//

import SwiftUI

protocol LevelCardViewDelegate: AnyObject {
    func levelCardDidEnd()
}

struct LevelCardView: View {
    
    let firstImageKey : String
    let secondImageKey : String
    
    @State private var fadeInOut = false
    
    weak var delegate: LevelCardViewDelegate?
    
    var body: some View {
        ZStack{
            Color.backgroundColor.ignoresSafeArea()
            Image(secondImageKey)
                .resizable()
                .frame(width: 370, height: 630)
            Image(firstImageKey)
                .resizable()
                .frame(width: 370, height: 630)
                .onAppear(){
                    withAnimation(Animation.easeInOut(duration: 0.6)
                        .repeatCount(5)){
                            fadeInOut.toggle()
                        }
                }.opacity(fadeInOut ? 0 : 1)
        }
        .onTapGesture {
            delegate?.levelCardDidEnd()
        }
    }
}
 
struct LevelCardView_Previews: PreviewProvider {
    static var previews: some View {
        LevelCardView(firstImageKey: "lv1juju", secondImageKey: "lv2juju")
    }
}
