//
//  CivilizationDTO.swift
//  Fyre
//
//  Created by Augusto Cesar do Nascimento dos Reis on 29/04/20.
//  Copyright © 2020 Augusto Reis. All rights reserved.
//

import Foundation

struct CivilizationDTO: Codable {

    var id: Int?
    var name: String?
    var expansion: String?
    var armyType: String?
    var uniqueUnit: [String]?
    var uniqueTech: [String]?
    var teamBonus: String?
    var civilizationBonus: [String]?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case expansion = "expansion"
        case armyType = "army_type"
        case uniqueUnit = "unique_unit"
        case uniqueTech = "unique_tech"
        case teamBonus = "team_bonus"
        case civilizationBonus = "civilization_bonus"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.expansion = try container.decodeIfPresent(String.self, forKey: .expansion)
        self.armyType = try container.decodeIfPresent(String.self, forKey: .armyType)
        self.uniqueUnit = try container.decodeIfPresent([String].self, forKey: .uniqueUnit)
        self.uniqueTech = try container.decodeIfPresent([String].self, forKey: .uniqueTech)
        self.teamBonus = try container.decodeIfPresent(String.self, forKey: .teamBonus)
        self.civilizationBonus = try container.decodeIfPresent([String].self, forKey: .civilizationBonus)
    }
    
}


