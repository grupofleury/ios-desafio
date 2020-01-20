//
//  ExameTableViewCell.swift
//  testeFleury
//
//  Created by Tatiana Rico on 19/01/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import UIKit

class ExameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var job: UILabel!
    @IBOutlet weak var doctorName: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var imageHealthy: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 
    func setup(exame: ExameElement) {
        
    }
}
