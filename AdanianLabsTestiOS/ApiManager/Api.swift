//
//  Api.swift
//  AdanianLabsTestiOS
//
//  Created by LCT AFRICA on 23/04/2022.
//

import Foundation
let base_Url = "https://pixabay.com"
let api_key = "\(base_Url)/api/?key=24825594-65c490e6dd73b0a38682fdecf"
let search_key = "\(api_key)&q="
let keys = "\(search_key)&image_type=photo"
let key = URL(string:"\(search_key)&image_type=photo")
