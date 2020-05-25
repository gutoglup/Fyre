//
//  ListCivilizationsView.swift
//  Fyre
//
//  Created by Augusto Cesar do Nascimento dos Reis on 28/04/20.
//  Copyright © 2020 Augusto Reis. All rights reserved.
//

import SwiftUI
import UIKit

struct ListCivilizationsView: View {
    
    @ObservedObject var controller = ListCivilizationsViewModel()
    
    var body: some View {
        
        List(controller.civilizations.indices, id: \.self) { index in
            ListDetailCell(name: self.$controller.civilizations[index].name , expansion: self.$controller.civilizations[index].expansion )
        }
        .navigationBarTitle("Civilizations")
        .onAppear(perform: controller.fetchCivilizations)
    }
}



struct ListCivilizationsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListCivilizationsView()
        }
    }
}


