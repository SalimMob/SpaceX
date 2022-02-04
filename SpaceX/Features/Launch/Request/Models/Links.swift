//
//  Links.swift
//  SpaceX
//
//  Created by Salim Maalouf on 2/2/22.
//

import Foundation

struct Links : Codable {
	let patch : Patch?
	let reddit : Reddit?
	let flickr : Flickr?
	let presskit : String?
	let webcast : String?
	let youtubeId : String?
	let article : String?
	let wikipedia : String?
    
    enum CodingKeys: String, CodingKey {
        case patch = "patch"
        case reddit = "reddit"
        case flickr = "flickr"
        case presskit = "presskit"
        case webcast = "webcast"
        case youtubeId = "youtube_id"
        case article = "article"
        case wikipedia = "wikipedia"
    }
}
