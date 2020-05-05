//
//  CivilizationRepository.swift
//  Fyre
//
//  Created by Augusto Cesar do Nascimento dos Reis on 29/04/20.
//  Copyright © 2020 Augusto Reis. All rights reserved.
//

import Foundation
import Combine
import Alamofire

struct CivilizationRepository {

    func listCivilizations() -> Future<[CivilizationDTO], Error> {
        let url = "https://age-of-empires-2-api.herokuapp.com/api/v1/civilizations"
        return Future { promisse in
            AF.request(url, method: .get).responseData { (response) in
                switch response.result {
                case .success(let data):
                    do {
                        if let civilizationsDTO = try JSONDecoder().decode(CivilizationResponseDTO.self, from: data).civilizations {
                            promisse(.success(civilizationsDTO))
                        } else {
                            promisse(.failure(RepositoryError.notFound))
                        }
                    } catch (let error) {
                        promisse(.failure(error))
                    }
                case .failure(let error):
                    promisse(.failure(error))
                }
            }
        }
    }
    
    
}

enum RepositoryError: Error {
    case notFound
}
