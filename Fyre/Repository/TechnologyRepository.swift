//
//  TechnologyRepository.swift
//  Fyre
//
//  Created by Augusto Cesar do Nascimento dos Reis on 15/05/20.
//  Copyright © 2020 Augusto Reis. All rights reserved.
//

import Foundation
import Combine
import Alamofire

struct TechnologyRepository {

    func listTecnologies() -> Future<[TechnologyDTO], Error> {
        let url = "https://age-of-empires-2-api.herokuapp.com/api/v1/technologies"
        return Future { promise in
            AF.request(url, method: .get).responseData { (response) in
                switch response.result {
                case .success(let data):
                    do {
                        if let tecnologyDTO = try JSONDecoder().decode(TecnologyResponseDTO.self, from: data).technologies {
                            promise(.success(tecnologyDTO))
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
