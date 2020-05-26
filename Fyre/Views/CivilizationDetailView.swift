//
//  CivilizationDetailView.swift
//  Fyre
//
//  Created by Augusto Cesar do Nascimento dos Reis on 25/05/20.
//  Copyright © 2020 Augusto Reis. All rights reserved.
//

import SwiftUI

struct CivilizationDetailView: View {
    
    @ObservedObject var viewModel: CivilizationDetailViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                VerticalDescriptionView(name: "Name", description: viewModel.civilization?.name ?? "")
                VerticalDescriptionView(name: "Expansion", description: viewModel.civilization?.expansion ?? "")
                VerticalDescriptionView(name: "Army type", description: viewModel.civilization?.armyType ?? "")
                VerticalDescriptionArrayView(name: "Unique Unit", descriptions: viewModel.civilization?.uniqueUnit ?? [])
                VerticalDescriptionView(name: "Team bonus", description: viewModel.civilization?.teamBonus ?? "")
                VerticalDescriptionArrayView(name: "Civilization bonus", descriptions: viewModel.civilization?.civilizationBonus ?? [])
                
            }
            .background(Color("background"))
        }
        .background(Color("background"))
        .navigationBarTitle(viewModel.civilization?.name ?? "")
        
    
    }
}

struct VerticalDescriptionArrayView: View {
    var name: String
    var descriptions: [String]
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text(name)
                    .foregroundColor(Color("subtitle"))
                ForEach(descriptions, id: \.self) { description in
                    Text(description)
                    .foregroundColor(Color("title"))
                }
            }
            .background(Color("background"))
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            Spacer()
        }
    }
}

struct VerticalDescriptionView: View {
    var name: String
    var description: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text(name)
                    .foregroundColor(Color("subtitle"))
                Text(description)
                    .foregroundColor(Color("title"))
            }
            .background(Color("background"))
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            Spacer()
        }
    }
}

struct CivilizationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CivilizationDetailView(viewModel:
                CivilizationDetailViewModel(civilization:
                    Civilization(
                        id: 0,
                        name: "Teste",
                        expansion: "Age",
                        armyType: "Army",
                        uniqueUnit: ["Unique 1", "Unique 2"],
                        uniqueTech: ["unique"],
                        teamBonus: "team",
                        civilizationBonus: []
                )))
        }
    }
}
