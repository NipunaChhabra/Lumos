//
//  Caching.swift
//  lumos
//
//  Created by Nipuna Chhabra on 7/1/21.
//
import Disk

let userDetailsCache = "userDetails.json"

struct Caching{
    
    static let sharedInstance = Caching()
    
    func saveUserDetailsToCache(user: User?){
        do{
            try Disk.save(user, to: .caches, as: userDetailsCache)
        }catch let error{
            print(error)
        }
    }
    
    func getUserDetailsFromCache() -> User? {
        do{
            let retrievedData = try Disk.retrieve(userDetailsCache, from: .caches, as: User.self)
            return retrievedData
        }catch let err{
            print(err)
            return nil
        }
    }
}
