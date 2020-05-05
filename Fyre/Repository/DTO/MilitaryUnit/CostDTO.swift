//
//  CostDTO.swift
//  Fyre
//
//  Created by Augusto Cesar do Nascimento dos Reis on 05/05/20.
//  Copyright © 2020 Augusto Reis. All rights reserved.
//

import Foundation

struct CostDTO: Codable {
    
    var wood: Int?
    var food: Int?
    var stone: Int?
    var gold: Int?
    
    enum CodingKeys: String, CodingKey {
        case wood = "Wood"
        case food = "Food"
        case stone = "Stone"
        case gold = "Gold"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.wood = try container.decodeIfPresent(Int.self, forKey: .wood)
        self.food = try container.decodeIfPresent(Int.self, forKey: .food)
        self.stone = try container.decodeIfPresent(Int.self, forKey: .stone)
        self.gold = try container.decodeIfPresent(Int.self, forKey: .gold)
    }
}
