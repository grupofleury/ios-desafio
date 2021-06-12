//
//  Controller.swift
//  ios-desafio
//
//  Created by Renato Ruiz Cai on 11/06/21.
//  Copyright © 2021 Renato Ruiz. All rights reserved.
//

import Foundation

class Controller {
    var examList: [ExamModel] = []
    var filteredExamList: [ExamModel] = []
    
    func fetchResults(completion: @escaping completion<Bool>){
        Provider().fetchResults {(res, error) in
            if let response = res {
                self.examList = response
                self.filteredExamList = response
                completion(true, false)
            }else {
                completion(false, true)
            }
        }
    }
}
