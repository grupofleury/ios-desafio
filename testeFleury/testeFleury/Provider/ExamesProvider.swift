//
//  ExamesProvider.swift
//  testeFleury
//
//  Created by Tatiana Rico on 18/01/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import Foundation
import Alamofire

class ExamesProvider {
    
    private let baseURL = "https://5bfbefa5cf9d29001345c529.mockapi.io/api"
    
    enum endPoint: String {
        case result = "/v1/results/"
    }
    
    func fleuryExames(completion: @escaping (Exames?,Bool) -> Void ) {
        
        if let url: URL = URL(string: baseURL+endPoint.result.rawValue) {
            Alamofire.request(url, method: .get).responseJSON { (response) in
                if response.response?.statusCode == 200 {
                    do {
                        let object = try
                            JSONDecoder().decode(Exames.self, from: response.data ?? Data())
                        print(object)
                        completion(object, true)
                    }
                    catch {
                        completion(nil, false)
                    }
                } else {
                    completion(nil, false)
                }
            }
        }
    }
}
