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
        performRequest(forRequest: request, success: { (response) in
            if let responseData = response.data {
                do {
                    let json = try JSONDecoder().decode([LaunchModel].self, from: responseData)
                    success(json)
                } catch DecodingError.dataCorrupted(let context) {
                    printD(context)
                } catch DecodingError.keyNotFound(let key, let context) {
                    printD("Key '\(key)' not found:", context.debugDescription)
                    printD("codingPath:", context.codingPath)
                } catch DecodingError.valueNotFound(let value, let context) {
                    printD("Value '\(value)' not found:", context.debugDescription)
                    printD("codingPath:", context.codingPath)
                } catch DecodingError.typeMismatch(let type, let context) {
                    printD("Type '\(type)' mismatch:", context.debugDescription)
                    printD("codingPath:", context.codingPath)
                } catch {
                    printD("error: ", error)
                }
            }
        }, failure: failure)
    }
}
