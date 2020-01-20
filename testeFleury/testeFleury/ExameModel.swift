//
//  ExameModel.swift
//  testeFleury
//
//  Created by Tatiana Rico on 18/01/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import Foundation

struct ExameElement: Codable {
    let id: Int
    let name, doctor: String
    let timestamp: Int
    let healthy: Bool
}

typealias Exames = [ExameElement]
