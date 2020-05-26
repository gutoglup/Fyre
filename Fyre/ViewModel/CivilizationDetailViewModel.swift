//
//  CivilizationDetailViewModel.swift
//  Fyre
//
//  Created by Augusto Cesar do Nascimento dos Reis on 26/05/20.
//  Copyright © 2020 Augusto Reis. All rights reserved.
//

import Foundation
import Combine

class CivilizationDetailViewModel: ObservableObject {

    @Published var civilization: Civilization?
    
    init(civilization: Civilization?) {
        self.civilization = civilization
    }
}
