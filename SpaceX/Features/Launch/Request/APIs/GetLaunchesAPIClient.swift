//
//  GetLaunchesAPIClient.swift
//  SpaceX
//
//  Created by Salim Maalouf on 2/2/22.
//

import Foundation

protocol GetLaunchesAPIClient {
    func fetchLaunches(success: @escaping ([LaunchModel]) -> (), failure: @escaping (Error) -> ())
}

extension APIClient: GetLaunchesAPIClient {
    
    func fetchLaunches(success: @escaping ([LaunchModel]) -> (), failure: @escaping (Error) -> ()) {
        let request = GetLaunchesRequest()
        getGeneric(forRequest: request, success: { response in
            success(response as [LaunchModel])
        }, failure: failure)
    }
}
