//
//  GetRocketsRequest.swift
//  SpaceX
//
//  Created by Salim Maalouf on 2/4/22.
//

import Foundation

struct GetRocketsRequest: Request {
    
    var rocketId: String
    
    var path: String {
        "/rockets/\(rocketId)"
    }
}
