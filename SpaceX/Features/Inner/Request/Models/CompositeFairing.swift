//
//  CompositeFairing.swift
//  SpaceX
//
//  Created by Salim Maalouf on 2/2/22.
//

import Foundation

struct CompositeFairing : Codable {
	let height : Height?
	let diameter : Diameter?
    
	enum CodingKeys: String, CodingKey {
		case height = "height"
		case diameter = "diameter"
	}
}
