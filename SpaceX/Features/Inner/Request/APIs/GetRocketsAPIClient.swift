//
//  GetRocketsAPIClient.swift
//  SpaceX
//
//  Created by Salim Maalouf on 2/2/22.
//

import Foundation

protocol GetRocketsAPIClient {
    func fetchRockets(rocketId: String, success: @escaping (RocketModel) -> (), failure: @escaping (Error) -> ())
}

extension APIClient: GetRocketsAPIClient {
    
    func fetchRockets(rocketId: String, success: @escaping (RocketModel) -> (), failure: @escaping (Error) -> ()) {
        let request = GetRocketsRequest(rocketId: rocketId)
        getGeneric(forRequest: request, success: { response in
            success(response as RocketModel)
        }, failure: failure)
    }
}
