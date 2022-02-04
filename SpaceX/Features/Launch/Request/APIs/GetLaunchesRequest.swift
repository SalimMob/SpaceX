//
//  GetLaunchesRequest.swift
//  SpaceX
//
//  Created by Salim Maalouf on 2/2/22.
//

import Foundation

struct GetLaunchesRequest: Request {
    
    var path: String {
        "/launches"
    }
}
