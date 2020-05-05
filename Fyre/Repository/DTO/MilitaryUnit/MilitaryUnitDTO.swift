//
//  MilitaryUnitDTO.swift
//  Fyre
//
//  Created by Augusto Cesar do Nascimento dos Reis on 05/05/20.
//  Copyright © 2020 Augusto Reis. All rights reserved.
//

import Foundation

struct MilitaryUnitDTO: Codable {

    var id: Int?
    var name: String?
    var description: String?
    var expansion: String?
    var age: String?
    var createdIn: String?
    var cost: CostDTO?
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
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case description = "description"
        case expansion = "expansion"
        case age = "age"
        case createdIn = "created_in"
        case cost = "cost"
        case buildTime = "build_time"
        case reloadTime = "reload_time"
        case attackDelay = "attack_delay"
        case movementRate = "movement_rate"
        case lineOfSight = "line_of_sight"
        case hitPoints = "hit_points"
        case range = "range"
        case attack = "attack"
        case armor = "armor"
        case accuracy = "accuracy"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.expansion = try container.decodeIfPresent(String.self, forKey: .expansion)
        self.age = try container.decodeIfPresent(String.self, forKey: .age)
        self.createdIn = try container.decodeIfPresent(String.self, forKey: .createdIn)
        self.cost = try container.decodeIfPresent(CostDTO.self, forKey: .cost)
        self.buildTime = try container.decodeIfPresent(Float.self, forKey: .buildTime)
        self.reloadTime = try container.decodeIfPresent(Float.self, forKey: .reloadTime)
        self.attackDelay = try container.decodeIfPresent(Float.self, forKey: .attackDelay)
        self.movementRate = try container.decodeIfPresent(Float.self, forKey: .movementRate)
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
        self.accuracy = try container.decodeIfPresent(String.self, forKey: .accuracy)
        
    }
}
