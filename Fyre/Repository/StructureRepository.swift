//
//  StructureRepository.swift
//  Fyre
//
//  Created by Augusto Cesar do Nascimento dos Reis on 11/05/20.
//  Copyright © 2020 Augusto Reis. All rights reserved.
//

import Foundation
import Combine
import Alamofire

struct StructureRepository {

    func listStructures() -> Future<[StructureDTO], Error> {
        let url = "https://age-of-empires-2-api.herokuapp.com/api/v1/structures"
        return Future { promise in
            AF.request(url, method: .get).responseData { (response) in
                switch response.result {
                case .success(let data):
                    do {
                        if let structureDTO = try JSONDecoder().decode(StructureResponseDTO.self, from: data).structures {
                            promise(.success(structureDTO))
                        } else {
                            promise(.failure(RepositoryError.notFound))
                        }
                    } catch (let error) {
                        promise(.failure(error))
                    }
                case .failure(let error):
                    promise(.failure(error))
                }
            }
            
        }
    }
    
    
}
