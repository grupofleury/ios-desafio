//
//  ExamModel.swift
//  ios-desafio
//
//  Created by Renato Ruiz Cai on 11/06/21.
//  Copyright © 2021 Renato Ruiz. All rights reserved.
//

import Foundation

struct ExamModel: Codable {
    let id: Int
    let name: String
    let doctor: String
    let timestamp: Int
    let healthy: Bool
}
