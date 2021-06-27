//
//  Service.swift
//  lumos
//
//  Created by Nipuna Chhabra on 6/26/21.
//

import Foundation
import Alamofire

class Service {
    fileprivate var baseUrl = ""
    typealias blogsCallBack = (_ blogs:[Blog]?, _ status: Bool, _ message:String) -> Void
    
    var callBack:blogsCallBack?
    
    init(baseUrl: String){
        self.baseUrl = baseUrl
    }


    func getAllBlogs(endPoint : String){
        AF.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            guard let data = responseData.data else {
                self.callBack?(nil, false, "")

                return}
            do{

            let blogs = try JSONDecoder().decode([Blog].self, from: data)
                //print("blogs==\(blogs)")
                self.callBack?(blogs, true,"")
            } catch {
                print("blog api same error")
                self.callBack?(nil, false, error.localizedDescription)
            }
            
        }
    }

func completionHandler(callBack: @escaping blogsCallBack) {
   self.callBack = callBack
}
}


