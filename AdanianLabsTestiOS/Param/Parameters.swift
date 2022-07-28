//
//  Parameters.swift
//  AdanianLabsTestiOS
//
//  Created by LCT AFRICA on 30/05/2022.
//

import Foundation
struct Parameters:Codable{
    let searchParam: String
    
    init(searchParam:String){
        self.searchParam = searchParam
    }
}
