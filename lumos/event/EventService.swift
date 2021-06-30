//
//  Service.swift
//  lumos
//
//  Created by Nipuna Chhabra on 6/26/21.
//

import Foundation
import Alamofire

class EventService {
    fileprivate var baseUrl = ""
    typealias eventCategoriesCallBack = (_ blogs:categoryModel?, _ status: Bool, _ message:String) -> Void
    
    var callBack:eventCategoriesCallBack?
    
    init(baseUrl: String){
        self.baseUrl = baseUrl
    }


    func getAllCategories(endPoint : String){
        AF.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            guard let data = responseData.data else {
                self.callBack?(nil, false, "")

                return}
            do{

            let cat = try JSONDecoder().decode(categoryModel.self, from: data)
                //print("blogs==\(blogs)")
                self.callBack?(cat, true,"")
            } catch {
                print("blog api same error")
                self.callBack?(nil, false, error.localizedDescription)
            }
            
        }
    }

func completionHandler(callBack: @escaping eventCategoriesCallBack) {
   self.callBack = callBack
}
}


