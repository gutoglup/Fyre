//
//  TechnologyDTO.swift
//  Fyre
//
//  Created by Augusto Cesar do Nascimento dos Reis on 15/05/20.
//  Copyright © 2020 Augusto Reis. All rights reserved.
//

import Foundation

struct TechnologyDTO: Codable {

    var id: Int?
    var name: String?
    var description: String?
    var expansion: String?
    var age: String?
    var developsIn: String?
    var cost: CostDTO?
    var buildTime: Float?
    var appliesTo: [String]?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case description = "description"
        case expansion = "expansion"
        case age = "age"
        case developsIn = "develops_in"
        case cost = "cost"
        case buildTime = "build_time"
        case appliesTo = "applies_to"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.expansion = try container.decodeIfPresent(String.self, forKey: .expansion)
        self.age = try container.decodeIfPresent(String.self, forKey: .age)
        self.developsIn = try container.decodeIfPresent(String.self, forKey: .developsIn)
        self.cost = try container.decodeIfPresent(CostDTO.self, forKey: .cost)
        self.buildTime = try container.decodeIfPresent(Float.self, forKey: .buildTime)
        self.appliesTo = try container.decodeIfPresent([String].self, forKey: .appliesTo)
    }
    
}
