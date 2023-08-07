//
//  CardCell.swift
//  MTGProyectoFinal
//
//  Created by Díez Sobrino Cristina on 1/8/23.
//

import Foundation
import SwiftUI

struct CardCellView: View {
    
    var card: Card
   
    
    init(card: Card) {
        self.card = card
    }
    
    var body: some View {
        VStack(alignment: .leading, content: { // Para alinear al inicio
            HStack(content: { // Para el row
                // Imagen
                AsyncImage(url: URL(string: card.imageUrl ?? ""),
                           content: { image in
                               image.resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 70, height: 130)
                                    .padding(20)
                           },
                           placeholder: {
                               ProgressView()
                            })

                
                // Nombre y descripción alineados al principio
                VStack (alignment: .leading, content: {
                    Text(card.name)
                        .fontWeight(.semibold)
                        //.font(.title3)
                        .font(.system(size: 16))
                   
                    Text(card.type)
                            .font(.system(size: 14))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .lineLimit(3)
                    
                })
                
                
                Spacer() // Spacer para apretar todo a la izquierda
            })
        })
        
    }
}

struct CardCellView_Previews: PreviewProvider {
    static var previews: some View {
        CardCellView(
            card: Card( imageUrl:  "https://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=409741&type=card" , name: "Archangel Avacyn", text: "Flash\nFlying, vigilance\nWhen Archangel Avacyn enters the battlefield, creatures you control gain indestructible until end of turn.\nWhen a non-Angel creature you control dies, transform Archangel Avacyn at the beginning of the next upkeep.", cmc: 1, colors: ["holi","adios"], manaCost: "{w}", type: "Legendary Creature - Angel", types: ["Creature", "Artifact"], supertypes: ["Legendary"], subtypes:["Angel"], rarity: "holi", power: "holi", toughness: "holi")
        )

    }
}
