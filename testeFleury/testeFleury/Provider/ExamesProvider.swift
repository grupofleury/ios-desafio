//
//  ExamesProvider.swift
//  testeFleury
//
//  Created by Tatiana Rico on 18/01/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import Foundation
import Alamofire

class ExamesFleury{
    
    func fleuryExames(completion: @escaping (ExameElement?,Bool) -> Void ){
        
        let urlString: String =  "http://5bfbefa5cf9d29001345c529.mockapi.io/api/v1/results/"
        
        if let url: URL = URL(string: urlString){
            Alamofire.request(url, method: .get).responseJSON { (response) in
                if response.response?.statusCode == 200{
                    
                    do{
                        if let data = response.data {
                            let object = try
                                JSONDecoder().decode(ExameElement.self, from: data)
                            print(object)
                            completion(object, true)
                        } else {
                            completion(nil, false)
                        }
                    }
                    catch{
                        completion(nil, false)
                    }
                } else {
                    completion(nil, false)
                }
            }
        }
    }
}
