//
//  SearchQuerry.swift
//  AdanianLabsTestiOS
//
//  Created by LCT AFRICA on 30/05/2022.
//

import Foundation
import Alamofire

public struct HTTPMethod:RawRepresentable,Equatable,Hashable{
    public static let query = HTTPMethod(rawValue: "QUERY")
    
    public let rawValue: String
    
    public init(rawValue:String){
        self.rawValue = rawValue
    }
    
}
    

