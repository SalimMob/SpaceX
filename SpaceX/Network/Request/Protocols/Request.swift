//
//  Request.swift
//  SpaceX
//
//  Created by Salim Maalouf on 2/2/22.
//


import Foundation
import Alamofire

protocol Request {
    var path: String { get }
    var method: HTTPMethod { get  }
    var headers: HTTPHeaders? { get }
}

extension Request {
    var headers: HTTPHeaders? {
        nil
    }
    
    var method: HTTPMethod {
        .get
    }
}
