//
//  CivilizationController.swift
//  Fyre
//
//  Created by Augusto Cesar do Nascimento dos Reis on 29/04/20.
//  Copyright © 2020 Augusto Reis. All rights reserved.
//

import Foundation
import Combine

class CivilizationController: ObservableObject {

    @Published var errorMessage: String = ""
    @Published var showAlert: Bool = false
    @Published var civilizations: [Civilization] = []
    
    var cancellable: AnyCancellable?
    
    func fetchCivilizations() {
        let repository = CivilizationRepository()
        cancellable = repository.listCivilizations()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.showAlert = true
                case .finished: break
                }
            }) { (data) in
                self.showAlert = false
                self.civilizations = data.map{ self.mappingCivilization($0) }
                
        }
    
    }
    
    func mappingCivilization(_ civilizationDTO: CivilizationDTO) -> Civilization {
        let civilization = Civilization(id: civilizationDTO.id,
                                        name: civilizationDTO.name,
                                        expansion: civilizationDTO.expansion,
                                        armyType: civilizationDTO.armyType,
                                        uniqueUnit: civilizationDTO.uniqueUnit,
                                        uniqueTech: civilizationDTO.uniqueTech,
                                        teamBonus: civilizationDTO.teamBonus,
                                        civilizationBonus: civilizationDTO.civilizationBonus)
        return civilization
    }
    
}
