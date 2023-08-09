//
//  TextExtension.swift
//  MTGProyectoFinal
//
//  Created by Díez Sobrino Cristina on 9/8/23.
//

import SwiftUI

//to use localizedStringKey inside a text
extension Text {
    init(imageText: String) {
        self.init(LocalizedStringKey(imageText: imageText))
    }
}
