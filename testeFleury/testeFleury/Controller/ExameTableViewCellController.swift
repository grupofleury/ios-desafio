//
//  ExameTableViewCellController.swift
//  testeFleury
//
//  Created by Tatiana Rico on 19/01/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import Foundation

class ExameTableViewCellController {
    
    var exame: ExameElement?
    
    init(exame: ExameElement) {
        self.exame = exame
    }
    
    var name: String {
        return self.exame?.name ?? ""
    }
    

}
