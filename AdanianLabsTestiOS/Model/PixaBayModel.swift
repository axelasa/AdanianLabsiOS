//
//  PixaBayModel.swift
//  AdanianLabsTestiOS
//
//  Created by LCT AFRICA on 23/04/2022.
//

import Foundation
var hintDetails:[Hits] = []
class Response :Codable{
    var total: Int!
    var totalHits: Int!
    var hits: [Hits]
}

class Hits:Codable{
    let tags: String
    let webformatURL:URL
    let user:String
    
    init(tags:String,webformatURL:URL,user:String){
        self.tags = tags
        self.webformatURL = webformatURL
        self.user = user
    }
}
