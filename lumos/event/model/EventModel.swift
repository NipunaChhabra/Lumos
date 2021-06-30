//
//  EventModel.swift
//  lumos
//
//  Created by Nipuna Chhabra on 6/27/21.
//

import Foundation
struct categoryModel: Codable{
    let status: String?
    let active: [EventCategories]?
}

struct EventCategories: Codable{
    let  name: String?
    let start_date: String?
    let end_date: String?
    let poster: String?
    let name_slug:String?
    let  description: String?
    let registration_link: String?
    let events: [event]?
    }

struct event: Codable{
    let name: String?
    let description: String?
    let is_completed: Bool?
    let registration_link: String?
    let event_date_set: [event_date_set]?
}

struct event_date_set: Codable{
    let venue: String?
    let start_date: String?
    let end_date: String?
    let title: String?
    
}
