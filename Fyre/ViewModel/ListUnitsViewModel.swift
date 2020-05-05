//
//  ListUnitsViewModel.swift
//  Fyre
//
//  Created by Augusto Cesar do Nascimento dos Reis on 05/05/20.
//  Copyright © 2020 Augusto Reis. All rights reserved.
//

import Foundation
import Combine

class ListUnitsViewModel: ObservableObject {

    @Published var errorMessage: String?
    @Published var showAlert = false
    @Published var units = [MilitaryUnit]()
    
    var cancellable: AnyCancellable?
    
    func fetchMilitaryUnits() {
        let repository = MilitaryUnitRepository()
        cancellable = repository.listMilitaryUnits()
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
                self.units = data.map{ self.mappingMilitaryUnit($0) }
            })
    }
    
    func mappingMilitaryUnit(_ militaryUnitDTO: MilitaryUnitDTO) -> MilitaryUnit {
        
        let cost = Cost(wood: militaryUnitDTO.cost?.wood, food: militaryUnitDTO.cost?.food, stone: militaryUnitDTO.cost?.stone, gold: militaryUnitDTO.cost?.gold)
        
        let militaryUnit = MilitaryUnit(
            id: militaryUnitDTO.id,
            name: militaryUnitDTO.name,
            description: militaryUnitDTO.description,
            expansion: militaryUnitDTO.expansion,
            age: militaryUnitDTO.age,
            createdIn: militaryUnitDTO.createdIn,
            cost: cost,
            buildTime: militaryUnitDTO.buildTime,
            reloadTime: militaryUnitDTO.reloadTime,
            attackDelay: militaryUnitDTO.attackDelay,
            movementRate: militaryUnitDTO.movementRate,
            lineOfSight: militaryUnitDTO.lineOfSight,
            hitPoints: militaryUnitDTO.hitPoints,
            range: militaryUnitDTO.range,
            attack: militaryUnitDTO.attack,
            armor: militaryUnitDTO.armor,
            accuracy: militaryUnitDTO.accuracy)
        
        return militaryUnit
    }
    
}
