//
//  ExamProvider.swift
//  DesafioFleury
//
//  Created by Camila Carvalho on 27/10/19.
//  Copyright © 2019 Camila Carvalho. All rights reserved.
//

import Foundation
import Alamofire


typealias completion <T> = (_ result: T, _ failure: Bool) -> Void

class ExamProvider {
    
    func  getListOfExams(completion: @escaping completion<Exam?>)  {
        
        Alamofire.request("http://5bfbefa5cf9d29001345c529.mockapi.io/api/v1/results/", method: .get).validate()
            .responseString(encoding: String.Encoding.utf8) { response in
                if let status = response.response?.statusCode {
                    print(status)
                    switch(status) {
                    case 200: do {
                        if let result = response.result.value {
                            print(result)
                            do {
                                let decodeObject = try JSONDecoder().decode(Exam.self, from: response.data ?? Data())
//                                print(decodeObject)
                                completion(decodeObject, false)
                            } catch {
                                completion(nil,true)
                            }
                            
                        }
                        }
                    default:
                        print("Erro")
                    }
                }
        }
    }
}

