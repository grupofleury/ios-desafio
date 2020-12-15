//
//  ExamModel.swift
//  DesafioFleury
//
//  Created by Camila Carvalho on 27/10/19.
//  Copyright © 2019 Camila Carvalho. All rights reserved.
//

import Foundation

// MARK: - ExamElement
struct ExamElement: Codable {
    let id: Int
    let name, doctor: String
    let timestamp: Int
    let healthy: Bool
}

typealias Exam = [ExamElement]
