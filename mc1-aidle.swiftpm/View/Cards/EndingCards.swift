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
                        
                        Text("앞으로도 아이들은계속해서 변화하고성장 할겁니다...\n기대해 주세요.").font(.custom(.dungGeun, size: 24))
                            .frame(width: proxy.size.width, height: proxy.size.height)
                        
                        ForEach(cards2, id: \.self) { card in
                            Image(card)
                                .resizable()
                                .scaledToFit()
                                .padding()
                        }
                        .frame(width: proxy.size.width, height: proxy.size.height)
                    }
                }
            }.onAppear {
                UIScrollView.appearance().isPagingEnabled = true
            }
        }
    }
}

struct EndingCards_Previews: PreviewProvider {
    static var previews: some View {
        EndingCards()
    }
}
