//
//  FontManager.swift
//  mc1-aidle
//
//  Created by 박승찬 on 2023/03/30.
//

import SwiftUI

enum MyCustomFonts: String, CaseIterable {
    
    //e.g, the fonts below:
    case dungGeun = "DungGeunMo.ttf"
    case neo = "NeoDunggeunmoPro-Regular.ttf"
    
    var fontName: String { String(self.rawValue.dropLast(4)) }
    var fileExtension: String { String(self.rawValue.suffix(3)) }
}


struct CustomFonts {
    static func register() {
        MyCustomFonts.allCases.forEach {
            registerFont(fontName: $0.fontName,
                         fontExtension: $0.fileExtension)
        }
    }
    
    private static func registerFont(fontName: String, fontExtension: String) {

        guard let fontURL = Bundle.main.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            print("Couldn't create \(fontName) from data")
            return
        }
        
        var error: Unmanaged<CFError>?
        
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
    
}

extension Font {
    static func custom(_ font: MyCustomFonts, size: CGFloat) -> Font {
        custom(font.fontName, size: size)
    }
}
