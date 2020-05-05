//
//  ListUnitsView.swift
//  Fyre
//
//  Created by Augusto Cesar do Nascimento dos Reis on 05/05/20.
//  Copyright © 2020 Augusto Reis. All rights reserved.
//

import SwiftUI

struct ListUnitsView: View {
    
    @ObservedObject var controller = ListUnitsViewModel()
    
    var body: some View {
        List(controller.units.indices, id: \.self) {index in
            ListDetailCell(name: self.$controller.units[index].name, expansion: self.$controller.units[index].expansion)
        }
        .navigationBarTitle("Units")
        .onAppear(perform: controller.fetchMilitaryUnits)
    }
}

struct ListUnitsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListUnitsView()
        }
    }
}
