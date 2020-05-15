//
//  ListStructuresViewModel.swift
//  Fyre
//
//  Created by Augusto Cesar do Nascimento dos Reis on 11/05/20.
//  Copyright © 2020 Augusto Reis. All rights reserved.
//

import Foundation
import Combine

class ListStructuresViewModel: ObservableObject {
    
    @Published var errorMessage: String?
    @Published var showAlert = false
    @Published var structures = [Structure]()
    
    var cancellable: AnyCancellable?
    
    func fetchStructures() {
        let repository = StructureRepository()
        cancellable = repository.listStructures()
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
                self.structures = data.map{ self.mappingStructure($0) }
            })
    }
    
    func mappingStructure(_ structureDTO: StructureDTO) -> Structure {
        let cost = Cost(wood: structureDTO.cost?.wood, food: structureDTO.cost?.food, stone: structureDTO.cost?.stone, gold: structureDTO.cost?.gold)
        let structure = Structure(
            id: structureDTO.id,
            name: structureDTO.name,
            description: structureDTO.description,
            expansion: structureDTO.expansion,
            age: structureDTO.age,
            cost: cost,
            buildTime: structureDTO.buildTime,
            hitPoints: structureDTO.hitPoints,
            lineOfSight: structureDTO.lineOfSight,
            armor: structureDTO.armor,
            range: structureDTO.range,
            reloadTime: structureDTO.reloadTime,
            attack: structureDTO.attack,
            special: structureDTO.special)
        return structure
    }
    
}
