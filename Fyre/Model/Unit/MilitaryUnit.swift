//
//  MilitaryUnit.swift
//  Fyre
//
//  Created by Augusto Cesar do Nascimento dos Reis on 05/05/20.
//  Copyright © 2020 Augusto Reis. All rights reserved.
//

import Foundation

struct MilitaryUnit: Identifiable {
    var id: Int?
    var name: String?
    var description: String?
    var expansion: String?
    var age: String?
    var createdIn: String?
    var cost: Cost?
    var buildTime: Float?
    var reloadTime: Float?
    var attackDelay: Float?
    var movementRate: Float?
    var lineOfSight: Int?
    var hitPoints: Int?
    var range: String?
    var attack: Int?
    var armor: String?
    var accuracy: String?
    
}
