//
//  EndingCards.swift
//  mc1-aidle
//
//  Created by 박승찬 on 2023/03/31.
//

import SwiftUI

struct EndingCards: View {
    let cards1 : [String] = [
        "lv2jake","lv2juju","lv2suri","lv2ddan","lv2byo","lv2theo"
    ]
    let cards2 : [String] = [
        "99jake","99juju","99suri","99ddan","99byo","99theo"
    ]
    
    @State var opacity: Double = 0
    
    var body: some View {
        return GeometryReader { proxy in
            ZStack{
                Color.backgroundColor.ignoresSafeArea()
                ScrollView(.horizontal) {
                    HStack(spacing: 0) {
                        ForEach(cards1, id: \.self) { card in
                            Image(card)
                                .resizable()
                                .scaledToFit()
                                .padding()
                        }
                        .frame(width: proxy.size.width, height: proxy.size.height)
                        
                        textView(text: "앞으로도 아이들은\n\n계속해서 변화하고\n\n성장 할겁니다.\n\n기대해주세요!", size: proxy.size)
                        
                        ForEach(cards2, id: \.self) { card in
                            Image(card)
                                .resizable()
                                .scaledToFit()
                                .padding()
                        }
                        .frame(width: proxy.size.width, height: proxy.size.height)
                        
                        textView(text: "-끝-", size: proxy.size)
                    }
                }
            }
            .opacity(opacity)
            .onAppear {
                let appearance = UIScrollView.appearance()
                appearance.isPagingEnabled = true
                appearance.showsVerticalScrollIndicator = false
                appearance.showsHorizontalScrollIndicator = false
                withAnimation(.easeIn(duration: 3)) {
                    opacity = 1
                }
            }
        }
    }
    
    private func textView(text: String, size: CGSize) -> some View {
        Text(text)
            .multilineTextAlignment(.center)
            .foregroundColor(.white)
            .font(.custom(.dungGeun, size: 32))
            .frame(width: size.width, height: size.height)
    }
}

struct EndingCards_Previews: PreviewProvider {
    static var previews: some View {
        EndingCards()
    }
}
