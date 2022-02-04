//
//  SecondStage.swift
//  SpaceX
//
//  Created by Salim Maalouf on 2/2/22.
//

import Foundation

struct SecondStage : Codable {
	let thrust : Thrust?
	let payloads : Payloads?
	let reusable : Bool?
	let engines : Int?
	let fuelAmountTons : Double?
	let burnTimeSec : Int?

	enum CodingKeys: String, CodingKey {
		case thrust = "thrust"
		case payloads = "payloads"
		case reusable = "reusable"
		case engines = "engines"
		case fuelAmountTons = "fuel_amount_tons"
		case burnTimeSec = "burn_time_sec"
	}
}
