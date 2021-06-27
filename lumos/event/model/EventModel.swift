//
//  EventModel.swift
//  lumos
//
//  Created by Nipuna Chhabra on 6/27/21.
//

import Foundation
struct categoryModel: Decodable{
    var active: [EventCategories]?
    var status: String?
}

struct EventCategories: Decodable {
    var name: String?
    var poster: String?
    var description: String?
    var registration_link: String?
    var events: [event]?
    }

struct event: Decodable{
    var name: String?
    var description: String?
    var registration_link: String?
    var event_date_set: [event_date_set]?
}

struct event_date_set: Decodable{
    var venue: String?
    var start_date: Date?
}
