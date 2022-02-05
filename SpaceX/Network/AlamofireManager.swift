//
//  AlamofireManager.swift
//  SpaceX
//
//  Created by Salim Maalouf on 2/2/22.
//

import Alamofire

enum Endpoint {
    static let main = "https://api.spacexdata.com/v4"
}

func printD(_ items: Any...) {
    #if DEBUG
    print(items)
    #endif
}

class AlamofireManager {

    static let shared = AlamofireManager()
    private var session = Session()
    private let timeInterval: TimeInterval = 120 //seconds
    
     init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = timeInterval
        configuration.timeoutIntervalForResource = timeInterval
        session = Alamofire.Session(configuration: configuration)
    }
    
    func performRequest(forRequest: Request, params: Parameters? = nil, encoding: ParameterEncoding = URLEncoding.default, success: @escaping (AFDataResponse<Data>) -> (), failure: @escaping (Error) -> ()) {
        session.request(Endpoint.main + forRequest.path, method: forRequest.method, parameters: params, encoding: encoding, headers: forRequest.headers).validate().responseData { (response) in
            switch response.result {
            case .success:
                success(response)
            case .failure(let error):
                failure(error)
            }
        }
    }
}
