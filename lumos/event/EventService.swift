//
//  EventService.swift
//  lumos
//
//  Created by Nipuna Chhabra on 6/27/21.
//

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
    typealias categoriesCallBack = (_ category:categoryModel?, _ status: Bool, _ message:String) -> Void
    
    var callBack:categoriesCallBack?
    
    init(baseUrl: String){
        self.baseUrl = baseUrl
    }


    func getAllCategories(endPoint : String){
        AF.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            guard let data = responseData.data else {
                self.callBack?(nil, false, "")
                return}
            do{
                print(data)
                
                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
//                let dateFormatter = DateFormatter()
//                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
////                dateFormatter.locale = Locale(identifier: "en_US")
////                dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
//                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                
            let cat = try decoder.decode(categoryModel.self, from: data)
                print("categories==\(cat)")
                self.callBack?(cat, true,"")
            } catch let error{
                print("Event Service File error \(error.localizedDescription)")
                self.callBack?(nil, false, error.localizedDescription)
            }
            
        }
    }

func completionHandler(callBack: @escaping categoriesCallBack) {
   self.callBack = callBack
}
}


