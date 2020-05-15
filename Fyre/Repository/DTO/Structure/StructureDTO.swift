//
//  StructureDTO.swift
//  Fyre
//
//  Created by Augusto Cesar do Nascimento dos Reis on 11/05/20.
//  Copyright © 2020 Augusto Reis. All rights reserved.
//

import Foundation

struct StructureDTO: Codable {

    var id: Int?
    var name: String?
    var description: String?
    var expansion: String?
    var age: String?
    var cost: CostDTO?
    var buildTime: Float?
    var hitPoints: Int?
    var lineOfSight: Int?
    var armor: String?
    var range: String?
    var reloadTime: Float?
    var attack: Int?
    var special: [String]?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case description = "description"
        case expansion = "expansion"
        case age = "age"
        case cost = "cost"
        case buildTime = "build_time"
        case hitPoints = "hit_points"
        case lineOfSight = "line_of_sight"
        case armor = "armor"
        case range = "range"
        case reloadTime = "reload_time"
        case attack = "attack"
        case special = "special"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.expansion = try container.decodeIfPresent(String.self, forKey: .expansion)
        self.age = try container.decodeIfPresent(String.self, forKey: .age)
        self.cost = try container.decodeIfPresent(CostDTO.self, forKey: .cost)
        self.buildTime = try container.decodeIfPresent(Float.self, forKey: .buildTime)
        self.reloadTime = try container.decodeIfPresent(Float.self, forKey: .reloadTime)
        self.lineOfSight = try container.decodeIfPresent(Int.self, forKey: .lineOfSight)
        self.hitPoints = try container.decodeIfPresent(Int.self, forKey: .hitPoints)
        if let value = try? container.decodeIfPresent(Int.self, forKey: .range) {
            self.range = String(value)
        }
        if let value = try? container.decodeIfPresent(String.self, forKey: .range) {
            self.range = value
        }
        self.attack = try container.decodeIfPresent(Int.self, forKey: .attack)
        self.armor = try container.decodeIfPresent(String.self, forKey: .armor)
        self.special = try container.decodeIfPresent([String].self, forKey: .special)
        
    }
    
    
}
