//
//  ExameController.swift
//  testeFleury
//
//  Created by Tatiana Rico on 18/01/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import Foundation
class ExameController{
    
    
    let exame  = ExamesFleury()
    
    private var desafio: ExameElement?
    var exameProvier: Exame?
    
    func getExame(completion: @escaping (Bool) -> Void){
        exame.fleuryExames(completion: { (exame, sucess) in
            if sucess{
                self.desafio = exame
                completion(true)
            }else{
                completion(false)
            }
        })
    }
    
    func  numberOfItemsInSection() -> Int{
        self.exameProvier?.count ?? 0
    }
    
    func getItemByIndex(indexPath: IndexPath) -> ExameElement{
        return self.exameProvier?[indexPath.row] ?? ExameElement(id: 0, name: "", doctor: "", timestamp: 0, healthy: false)
    }
}

