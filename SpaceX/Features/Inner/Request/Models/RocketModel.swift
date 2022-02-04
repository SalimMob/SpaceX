//
//  RocketModel.swift
//  SpaceX
//
//  Created by Salim Maalouf on 2/2/22.
//

import Foundation

struct RocketModel : Codable {
	let height : Height?
	let diameter : Diameter?
	let mass : Mass?
	let firstStage : FirstStage?
	let secondStage : SecondStage?
	let engines : Engines?
	let landingLegs : LandingLegs?
	let payloadWeights : [PayloadWeights]?
	let flickrImages : [String]?
	let name : String?
	let type : String?
	let active : Bool?
	let stages : Int?
	let boosters : Int?
	let costPerLaunch : Int?
	let successRatePct : Int?
	let firstFlight : String?
	let country : String?
	let company : String?
	let wikipedia : String?
	let description : String?
	let id : String?

	enum CodingKeys: String, CodingKey {
		case height = "height"
		case diameter = "diameter"
		case mass = "mass"
		case firstStage = "first_stage"
		case secondStage = "second_stage"
		case engines = "engines"
		case landingLegs = "landing_legs"
		case payloadWeights = "payload_weights"
		case flickrImages = "flickr_images"
		case name = "name"
		case type = "type"
		case active = "active"
		case stages = "stages"
		case boosters = "boosters"
		case costPerLaunch = "cost_per_launch"
		case successRatePct = "success_rate_pct"
		case firstFlight = "first_flight"
		case country = "country"
		case company = "company"
		case wikipedia = "wikipedia"
		case description = "description"
		case id = "id"
	}
}
