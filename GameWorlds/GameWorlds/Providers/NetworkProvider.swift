//
//  NetworkProvider.swift
//  GameWorlds
//
//  Created by liza_kaganskaya on 6/14/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

class NetworkProvider {
    
    
    
    let url = "http://backend1.lordsandknights.com/XYRALITY/WebObjects/BKLoginServer.woa/wa/worlds"
    
    let type = UIDevice.current.model + UIDevice.current.systemName + UIDevice.current.systemVersion
   
    let deviceId = UIDevice.current.identifierForVendor!
    
    
    
    
    func getWorlds(login:String,password:String)->Observable<[Worlds]>{
        
        let parameters =  ["login": login, "password": password, "deviceType": type, "deviceId": deviceId] as [String : Any]
        
        return Observable<[Worlds]>.create { observer  in
    
            let request = Alamofire
                
                .request(self.url, method: .post, parameters: parameters)
                
                .responsePropertyList(completionHandler: { response in
           
                    let value:  NSDictionary?  = response.result.value as? NSDictionary
            
                    let listValues =  value?["allAvailableWorlds"]
        
                    let decoder = PropertyListDecoder()
        
                    if let data = try? PropertyListSerialization.data(fromPropertyList: listValues as! NSArray, format:PropertyListSerialization.PropertyListFormat.xml , options: PropertyListSerialization.WriteOptions(0)) {
                
                        do{
        
                            let content:[Worlds] = try decoder.decode([Worlds].self, from: data)
        
                            observer.onNext(content)
                            observer.onCompleted()
                        
                        }catch let error as NSError{
                            observer.onError(error)
                        }
                    }
                
                })
            
            return Disposables.create(with: {
                request.cancel()
            })
           
        }
        
    }

    
}
