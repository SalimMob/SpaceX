//
//  Fairings.swift
//  SpaceX
//
//  Created by Salim Maalouf on 2/2/22.
//

import Foundation

struct Fairings : Codable {
	let reused : Bool?
	let recoveryAttempt : Bool?
	let recovered : Bool?
	let ships : [String]?
    
    enum CodingKeys: String, CodingKey {
        case reused = "reused"
        case recoveryAttempt = "recovery_attempt"
        case recovered = "recovered"
        case ships = "ships"
    }
}
