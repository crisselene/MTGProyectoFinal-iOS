//
//  DetailView.swift
//  MTGProyectoFinal
//
//  Created by Díez Sobrino Cristina on 4/8/23.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var detailViewModel: DetailViewModel
    
    init( detailViewModel: DetailViewModel) {
        self.detailViewModel = detailViewModel
    }

    var body: some View {
        ScrollView {
            VStack{
                Text(detailViewModel.card.name)
                    .font(.custom("Palatino", size: 28).bold())
                
                AsyncImage(url: URL(string: detailViewModel.card.imageUrl ?? ""),
                           content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width:300, height: 500)
                },
                           placeholder: {
                    ProgressView()
                }).accessibilityLabel("image of "+detailViewModel.card.name)
           
               
                Text(detailViewModel.card.type).font(.custom("Times New Roman", size: 20)).bold()
                
                HStack(alignment: .top, spacing: 0) {
                    Text(imageText: detailViewModel.card.text).font(.custom("Times New Roman", size: 20))
                }.padding()
                
                VStack {
                    Text("Mana cost: ").font(.custom("Palatino", size: 18).bold())+Text(imageText: detailViewModel.card.manaCost)
                    
                    if(detailViewModel.card.power != nil && detailViewModel.card.toughness != nil){
                        Text("Power/Toughness: ").font(.custom("Palatino", size: 18).bold())+Text(" "+detailViewModel.card.power!+"/"+detailViewModel.card.toughness!).font(.custom("Times New Roman", size: 18))
                    }
                   
                    Text("Rarity: ").font(.custom("Palatino", size: 18).bold())+Text(" "+detailViewModel.card.rarity).font(.custom("Times New Roman", size: 18))
    
                }.padding()
                           
            }.padding(20)
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(
            detailViewModel: DetailViewModel(card: Card( imageUrl:  "https://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=409741&type=card" , name: "Archangel Avacyn", text: "Flash\nFlying, vigilance\n {W} When Archangel Avacyn enters the battlefield, creatures you control gain indestructible until end of turn.\nWhen a non-Angel creature you control dies, transform Archangel Avacyn at the beginning of the next upkeep.", cmc: 1, colors: ["holi","adios"], manaCost: "{w}", type: "Legendary Creature - Angel", types: ["Creature", "Artifact"] , supertypes: ["Legendary"], subtypes:["Angel"], rarity: "mythic", power: "4", toughness: "4"),repository: RepositoryImpl(remoteDataSource: RemoteDataSourceImpl()))
        )
    }
}
