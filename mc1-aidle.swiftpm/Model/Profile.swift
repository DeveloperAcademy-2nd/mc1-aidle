//
//  Profile.swift
//  mc1-aidle
//
//  Created by 박승찬 on 2023/03/28.
//

import Foundation

class Profile {
    let chapter: String
    let title : String
    let ability: [String]
    let abilityLebel: [String]
    let animate: Profile?
    
    init(chapter: String, title: String, ability: [String], abilityLebel: [String], animate: Profile? = nil) {
        self.chapter = chapter
        self.title = title
        self.ability = ability
        self.abilityLebel = abilityLebel
        self.animate = animate
    }
}

extension Profile {
    static let juju = Profile(
        chapter: "Chapter.1", title: "숨막히는 첫만남",ability: ["열정","발표","춤"], abilityLebel: ["🔥🔥🔥🔥🔥","🌟🌟","⭐️⭐️⭐️⭐️⭐️"], animate: .juju2)
    
    static let juju2 = Profile(
        chapter: "", title: "", ability: ["열정","발표","춤"], abilityLebel: ["🔥🔥🔥","🌟🌟","⭐️⭐️⭐️⭐️⭐️"])
}
