//
//  DataBase.swift
//  marvelApp
//
//  Created by idaira aleman quintana on 19/3/22.
//

import Foundation

struct Comics: Codable{
    var comics: [ComicsItem]
}

struct ComicsItem: Codable{
    var id: Int
    var title: String
    var description: String?
    var thumbnail:Thumbnail
}

struct Thumbnail:Codable{
    var path:String
    var `extension`:String
}

struct ComicsResponse:Codable{
    var data:ComicsResponseData
}

struct ComicsResponseData:Codable{
    var results:Array<ComicsItem>
}
