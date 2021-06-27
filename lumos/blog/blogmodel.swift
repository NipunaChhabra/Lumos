//
//  blogmodel.swift
//  lumos
//
//  Created by Nipuna Chhabra on 6/26/21.
//

import Foundation
struct Blog: Decodable {
    var title: String?
    var timeToRead: Int?
    var author:String?
    var tags:[String]?
    var aboutAuthor:String?
    var shortDescription:String?
    var imageurl:String?
    var _id:String?
}
