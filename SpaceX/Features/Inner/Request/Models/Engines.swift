//
//  Engines.swift
//  SpaceX
//
//  Created by Salim Maalouf on 2/2/22.
//

import Foundation

struct Engines : Codable {
	let isp : Isp?
	let thrustSeaLevel : ThrustSeaLevel?
	let thrustVacuum : ThrustVacuum?
	let number : Int?
	let type : String?
	let version : String?
	let layout : String?
	let engineLossMax : Int?
	let propellant1 : String?
	let propellant2 : String?
	let thrustToWeight : Double?
    
	enum CodingKeys: String, CodingKey {
		case isp = "isp"
		case thrustSeaLevel = "thrust_sea_level"
		case thrustVacuum = "thrust_vacuum"
		case number = "number"
		case type = "type"
		case version = "version"
		case layout = "layout"
		case engineLossMax = "engine_loss_max"
		case propellant1 = "propellant_1"
		case propellant2 = "propellant_2"
		case thrustToWeight = "thrust_to_weight"
	}
}
