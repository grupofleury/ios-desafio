//
//  ExameController.swift
//  testeFleury
//
//  Created by Tatiana Rico on 18/01/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import Foundation

class ExameController {
    
    var exames: Exames?
    private var provider: ExamesProvider = ExamesProvider()
    
    func getExame(completion: @escaping (Bool) -> Void){
        provider.fleuryExames(completion: { (exames, sucess) in
            if sucess{
                self.exames = exames
                completion(true)
            }else{
                completion(false)
            }
        })
    }
    
    func  numberOfItemsInSection() -> Int {
        self.exames?.count ?? 0
    }
    
    func getItemByIndex(indexPath: IndexPath) -> ExameElement {
        return self.exames?[indexPath.row] ?? ExameElement(id: 0, name: "", doctor: "", timestamp: 0, healthy: false)
    }
}

