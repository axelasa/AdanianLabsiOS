//
//  NetworkCall.swift
//  AdanianLabsTestiOS
//
//  Created by LCT AFRICA on 23/04/2022.
//

import Foundation
import Alamofire
import UIKit

typealias Handler = (Swift.Result<Any?, DefultResponse>) -> Void
typealias ArrayHandler = (Swift.Result<Array<Any>?,DefultResponse>) -> Void
class NetworkCall{
    static let shareInstance = NetworkCall()
    //static let
    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    func callPicsApi(completionHandler:@escaping Handler){
        AF.request(keys,method: .get,parameters: nil,encoding: URLEncoding.default,headers: nil,interceptor: nil).responseData { response in debugPrint(response)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                switch response.result{
                    
                case .success(let data):
                    do{
                        if response.response?.statusCode == 200{
                            print("HERE IS THE RESPONSE ->Starting decoding  \(String(describing: data))")
                            let decoder = JSONDecoder()
                            let json = try decoder.decode(Response.self, from: data)
                            print(json)
                            completionHandler(.success(json))
                        }else{
                            completionHandler(.failure(.custom(message: "FAILED")))
                        }
                    }catch{
                        print(error)
                    }
                case .failure(let err):
                    print(err.localizedDescription)
                }
            }
        }
    }
    func searchImageApi(param:String,completionHandler:@escaping Handler){
        AF.request(search_key+param,method: .get,parameters:nil,encoding: URLEncoding.queryString,headers: nil,interceptor: nil).responseData {
            response in
            debugPrint(response)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                switch response.result{
                case .success(let data):
                    do{
                        if response.response?.statusCode == 200{
                            print("HERE IS THE RESPONSE ->Starting decoding  \(String(describing: data))")
                            let decoder = JSONDecoder()
                            let json = try decoder.decode(Response.self, from: data)
                            print(json)
                            completionHandler(.success(json))
                        }else{
                            completionHandler(.failure(.custom(message: "FAILED")))
                        }
                    }catch{
                        print(error)
                    }
                case .failure(let err):
                    print(err.localizedDescription)
                }
            }
        }
    }
    
//    func seePicsApi(){
//        let request =  URLRequest(url: key!)
//        let session = URLSession.shared.dataTask(with: request, completionHandler: { data,response,error in
//
//            if let error = error {
//                print("There was an Error \(error.localizedDescription)")
//            }else if let data = data {
//                let json = try! JSONSerialization.jsonObject(with: data,options: [])
//                print(json)
//            }
//
//        })
//        session.resume()
//    }
}

extension URLRequest{
    public var method:HTTPMethod?{
        get{httpMethod.flatMap(HTTPMethod.init) }
        set{httpMethod = newValue?.rawValue}
    }
}
