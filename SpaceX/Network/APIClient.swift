//
//  APIClient.swift
//  SpaceX
//
//  Created by Salim Maalouf on 2/5/22.
//

import Foundation

class APIClient {
    func getGeneric<T: Codable>(forRequest: Request, success: @escaping (T) -> (), failure: @escaping (Error) -> ()) {
        AlamofireManager.shared.performRequest(forRequest: forRequest, success: { (response) in
            if let responseData = response.data {
                do {
                    let json = try JSONDecoder().decode(T.self, from: responseData)
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
