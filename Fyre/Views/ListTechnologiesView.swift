//
//  ListTechnologiesView.swift
//  Fyre
//
//  Created by Augusto Cesar do Nascimento dos Reis on 15/05/20.
//  Copyright © 2020 Augusto Reis. All rights reserved.
//

import SwiftUI

struct ListTechnologiesView: View {
    
    @ObservedObject var viewModel = ListTechnologiesViewModel()
    
    var body: some View {
        List(viewModel.tecnologies.indices, id: \.self) { (index) in
            ListDetailCell(name: self.$viewModel.tecnologies[index].name, expansion: self.$viewModel.tecnologies[index].expansion)
        }
        .navigationBarTitle("Technolgies")
        .onAppear(perform: viewModel.fetchTecnologies)
    }
}

struct ListTecnologiesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListTechnologiesView()
        }
    }
}
