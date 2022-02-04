//
//  Payloads.swift
//  SpaceX
//
//  Created by Salim Maalouf on 2/2/22.
//

import Foundation

struct Payloads : Codable {
	let compositeFairing : CompositeFairing?
	let option1 : String?

	enum CodingKeys: String, CodingKey {
		case compositeFairing = "composite_fairing"
		case option1 = "option_1"
	}
}
