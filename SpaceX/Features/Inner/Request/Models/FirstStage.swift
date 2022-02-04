//
//  FirstStage.swift
//  SpaceX
//
//  Created by Salim Maalouf on 2/2/22.
//

import Foundation

struct FirstStage : Codable {
	let thrustSeaLevel : ThrustSeaLevel?
	let thrustVacuum : ThrustVacuum?
	let reusable : Bool?
	let engines : Int?
	let fuelAmountTons : Double?
	let burnTimeSec : Int?

	enum CodingKeys: String, CodingKey {
		case thrustSeaLevel = "thrust_sea_level"
		case thrustVacuum = "thrust_vacuum"
		case reusable = "reusable"
		case engines = "engines"
		case fuelAmountTons = "fuel_amount_tons"
		case burnTimeSec = "burn_time_sec"
	}
}
