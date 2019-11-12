//
//  APIKonfio.swift
//  appkonfio
//
//  Created by Jorge on 11/11/19.
//  Copyright © 2019 pagatodo. All rights reserved.
//

import Foundation
import Moya

/**
 communication interface for CoDi´s services in Einar
 */
public enum APIKonfio {
    case asyncDogList
}

extension APIKonfio: TargetType {
        
    public var baseURL: URL{
        return URL(string: "https://api.myjson.com/bins/")!
    }
    
    public var path: String{
        switch self {
        case .asyncDogList:
            return "kp2e8"
        }
    }
    
    public var method: Moya.Method{
        return .get
    }
    
    public var parameters: [String: Any]? {
        return nil
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    public var headers: [String : String]?{
        switch self {
        case .asyncDogList:
            return ["Content-Type": "application/json"]
        }
    }
    
    public var sampleData: Data{
        return Data()
    }
    
    public var task: Task{
        switch self {
        case .asyncDogList:
            return .requestPlain
        }
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}

