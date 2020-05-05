//
//  MilitaryUnitRepository.swift
//  Fyre
//
//  Created by Augusto Cesar do Nascimento dos Reis on 05/05/20.
//  Copyright © 2020 Augusto Reis. All rights reserved.
//

import Foundation
import Combine
import Alamofire

struct MilitaryUnitRepository {

    func listMilitaryUnits() -> Future<[MilitaryUnitDTO], Error> {
        let url = "https://age-of-empires-2-api.herokuapp.com/api/v1/units"
        return Future { promise in
            AF.request(url, method: .get).responseData { (response) in
                switch response.result {
                case .success(let data):
                    do {
                    if let militaryUnitsDTO = try JSONDecoder().decode(MilitaryUnitResponseDTO.self, from: data).units {
                        promise(.success(militaryUnitsDTO))
                    } else {
                        promise(.failure(RepositoryError.notFound))
                    }
                    }catch (let error) {
                        promise(.failure(error))
                    }
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
    }
}
