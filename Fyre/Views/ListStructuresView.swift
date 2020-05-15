//
//  ListStructuresView.swift
//  Fyre
//
//  Created by Augusto Cesar do Nascimento dos Reis on 11/05/20.
//  Copyright © 2020 Augusto Reis. All rights reserved.
//

import SwiftUI

struct ListStructuresView: View {
    
    @ObservedObject var viewModel = ListStructuresViewModel()
    
    var body: some View {
        List(viewModel.structures.indices, id: \.self) { index in
            ListDetailCell(
                name: self.$viewModel.structures[index].name,
                expansion: self.$viewModel.structures[index].expansion)
        }
        .navigationBarTitle("Structures")
        .onAppear(perform: viewModel.fetchStructures)
    }
}

struct ListStructuresView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListStructuresView()
        }
    }
}
