//
//  Provider.swift
//  ios-desafio
//
//  Created by Renato Ruiz Cai on 11/06/21.
//  Copyright © 2021 Renato Ruiz. All rights reserved.
//

import Foundation
import Alamofire

typealias completion <T> = (_ result: T, _ failure: Bool) -> Void

class Provider {
    func fetchResults(completion: @escaping completion<[ExamModel]?>) {
        Alamofire.request("http://5bfbefa5cf9d29001345c529.mockapi.io/api/v1/results/", method: .get).validate().responseString(encoding: String.Encoding.utf8) {res in
            if let statusCode = res.response?.statusCode {
                if statusCode == 200 {
                    if let _ = res.result.value {
                        do {
                            let decodedList = try JSONDecoder().decode([ExamModel].self, from: res.data ?? Data())
                            completion(decodedList, false)
                        } catch {
                            completion(nil,true)
                        }
                    }
                }
            }
        }
    }
}
