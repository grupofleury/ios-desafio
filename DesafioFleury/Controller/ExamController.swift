//
//  ExamController.swift
//  DesafioFleury
//
//  Created by Camila Carvalho on 27/10/19.
//  Copyright © 2019 Camila Carvalho. All rights reserved.
//

import Foundation

class ExamController {
    
    private var arrayExam: [ExamElement?] = []
    private var arrayExamFiltered: [ExamElement?] = []
    private var examSelected: ExamElement?
    
    func loadExamSelected(index: Int) {
        self.examSelected = self.arrayExamFiltered[index]
    }
    
    func applyFilter(searchString: String) {
        if searchString.count == 0 {
            self.arrayExamFiltered = self.arrayExam
        } else {
            self.arrayExamFiltered = self.arrayExam.filter{
                $0?.name.localizedCaseInsensitiveContains(searchString) ?? false
            }
        }
    }
    
    func loadExamSelected() -> ExamElement? {
        return self.examSelected
    }
    
    func numberOfRowsInSection() -> Int {
        return self.arrayExamFiltered.count
    }
    
    func loadCurrentExam(indexPath: IndexPath) -> ExamElement? {
        return self.arrayExamFiltered[indexPath.row]
    }
    
    func  getListOfExams(completion: @escaping completion<Bool>) {
        ExamProvider().getListOfExams { (response, error) in
            if let _response = response {
                self.arrayExamFiltered = _response
                self.arrayExam = _response
                completion(true, false)
            } else {
                completion(false, true)
            }
        }
        
    }
}
