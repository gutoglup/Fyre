//
//  ListTechnologiesViewModel.swift
//  Fyre
//
//  Created by Augusto Cesar do Nascimento dos Reis on 15/05/20.
//  Copyright © 2020 Augusto Reis. All rights reserved.
//

import Foundation
import Combine

class ListTechnologiesViewModel: ObservableObject {

    @Published var errorMessage: String?
    @Published var showAlert: Bool = false
    @Published var tecnologies = [Technology]()
    
    var cancellable: AnyCancellable?
    
    func fetchTecnologies() {
        let repository = TechnologyRepository()
        cancellable = repository.listTecnologies()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.showAlert = true
                case .finished: break
                }
            }, receiveValue: { (data) in
                self.showAlert = false
                self.tecnologies = data.map { self.mappingTecnologies($0) }
            })
    }
    
    func mappingTecnologies(_ tecnologyDTO: TechnologyDTO) -> Technology {
        let cost = Cost(wood: tecnologyDTO.cost?.wood, food: tecnologyDTO.cost?.food, stone: tecnologyDTO.cost?.stone, gold: tecnologyDTO.cost?.gold)
        let tecnology = Technology(
            id: tecnologyDTO.id,
            name: tecnologyDTO.name,
            description: tecnologyDTO.description,
            expansion: tecnologyDTO.expansion,
            age: tecnologyDTO.age,
            developsIn: tecnologyDTO.developsIn,
            cost: cost,
            buildTime: tecnologyDTO.buildTime,
            appliesTo: tecnologyDTO.appliesTo)
        return tecnology
    }
    
}
