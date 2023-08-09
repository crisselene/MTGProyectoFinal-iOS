//
//  LocalizedStringKeyExtension.swift
//  MTGProyectoFinal
//
//  Created by Díez Sobrino Cristina on 9/8/23.
//

import SwiftUI

//to interpolate images inside text
extension LocalizedStringKey {

    private static let symbolMap: [String:String] = [
        "1": "1Image",
        "2": "2Image",
        "3": "3Image",
        "4": "4Image",
        "5": "5Image",
        "6": "6Image",
        "7": "7Image",
        "B": "BImage",
        "W": "WImage",
        "R": "RImage",
        "U": "UImage",
        "T": "TImage",
        "G": "GImage"
    ]

    init(imageText: String) {
        var components = [Any]()
        var length = 0
        let scanner = Scanner(string: imageText)
        scanner.charactersToBeSkipped = nil
        while scanner.isAtEnd == false {
            let up = scanner.scanUpToString("{")
            let start = scanner.scanString("{")
            let name = scanner.scanUpToString("}")
            let end = scanner.scanString("}")
            if let up = up {
                components.append(up)
                length += up.count
            }
            if let name = name {
                if start != nil, end != nil, let imageName = Self.symbolMap[name] {
                    print(imageName)
                    components.append(Image(imageName))
                    length += 1
                } else {
                    components.append(name)
                }
            }
        }

        var interp = LocalizedStringKey.StringInterpolation(literalCapacity: length, interpolationCount: components.count)
        for component in components {
            if let string = component as? String {
                interp.appendInterpolation(string)
            }
            if let image = component as? Image {
                interp.appendInterpolation(image.resizable())
            }
        }

        self.init(stringInterpolation: interp)
    }
}



