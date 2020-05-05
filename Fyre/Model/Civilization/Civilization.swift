//
//  Civilization.swift
//  Fyre
//
//  Created by Augusto Cesar do Nascimento dos Reis on 29/04/20.
//  Copyright © 2020 Augusto Reis. All rights reserved.
//

import Foundation

struct Civilization: Identifiable {
    var id: Int?
    var name: String?
    var expansion: String?
    var armyType: String?
    var uniqueUnit: [String]?
    var uniqueTech: [String]?
    var teamBonus: String?
    var civilizationBonus: [String]?
}
