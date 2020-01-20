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
    @IBOutlet weak var doctor: UILabel!
    @IBOutlet weak var doctorName: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var imageHealthy: UIImageView!
    @IBOutlet weak var shadowView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        shadowView.layer.shadowOpacity = 0.7
        shadowView.layer.shadowRadius = 5
        shadowView.layer.cornerRadius = 5
        shadowView.backgroundColor = UIColor.white
        shadowView.layer.shadowColor = UIColor.gray.cgColor
        shadowView.layer.shadowOffset = .zero
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 
    func setup(exame: ExameTableViewCellController) {
        self.name.text = exame.name
        self.doctorName.text = exame.doctor
        self.date.text = exame.timestamp
        self.imageHealthy.image = exame.healthy ? #imageLiteral(resourceName: "positiveIcon") : #imageLiteral(resourceName: "negativeIcon")   
    }
}
