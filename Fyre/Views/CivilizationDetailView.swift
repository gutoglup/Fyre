//
//  CivilizationDetailView.swift
//  Fyre
//
//  Created by Augusto Cesar do Nascimento dos Reis on 28/04/20.
//  Copyright © 2020 Augusto Reis. All rights reserved.
//

import SwiftUI

struct CivilizationDetailView: View {
    
    @ObservedObject var controller = CivilizationController()
    
    var body: some View {
        List(controller.civilizations.indices, id: \.self) { index in
            CivilizationCellView(civilization: self.$controller.civilizations[index])
        }
        .navigationBarTitle("Civilizações")
        .onAppear(perform: controller.fetchCivilizations)
    }
}

struct CivilizationCellView: View {
    
    @Binding var civilization: Civilization
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text(civilization.name ?? "")
                .foregroundColor(Color("title"))
                .padding(.bottom, 4)
            Text(civilization.expansion ?? "")
                .font(.subheadline)
                .foregroundColor(Color("subtitle"))
        }
    }
}

struct CivilizationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CivilizationDetailView()
        }
    }
}


