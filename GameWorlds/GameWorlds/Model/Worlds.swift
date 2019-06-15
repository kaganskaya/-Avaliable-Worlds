//
//  Worlds.swift
//  GameWorlds
//
//  Created by liza_kaganskaya on 6/15/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import Foundation

struct Worlds:Decodable {
    private enum CodingKeys: String, CodingKey {
        case country, id, language,mapURL,name,requiredCapabilities,url,worldStatus
    }
    let country:String?
    let id:String?
    let language:String?
    let mapURL:String?
    let name:String?
    let requiredCapabilities:[String]?
    let url:String?
    let worldStatus:WorldStatus?
    
}
struct WorldStatus:Decodable {
    private enum CodingKeys: String, CodingKey {
        case description, id
    }
    let description: String?
    let id:String?
    
}
