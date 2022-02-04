//
//  Isp.swift
//  SpaceX
//
//  Created by Salim Maalouf on 2/2/22.
//

import Foundation

struct Isp : Codable {
	let seaLevel : Int?
	let vacuum : Int?

	enum CodingKeys: String, CodingKey {
		case seaLevel = "sea_level"
		case vacuum = "vacuum"
	}
}
