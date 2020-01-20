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
    
    var doctor: String {
        return self.exame?.doctor ?? ""
    }

    var timestamp: String {
        let numStr = String(self.exame?.timestamp ?? 0)
        let strFormatted = numStr[..<numStr.index(numStr.startIndex, offsetBy: 10)]
        return Double(strFormatted)?.dateFormatted(withFormat: "dd/MM/yyyy") ?? ""
    }
    
    var healthy: Bool {
        return self.exame?.healthy ?? false
    }
    
}
