//
//  CardCellTableViewCell.swift
//  ios-desafio
//
//  Created by Renato Ruiz Cai on 11/06/21.
//  Copyright © 2021 Renato Ruiz. All rights reserved.
//

import UIKit

class CardCellTableViewCell: UITableViewCell {
    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var examLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.layer.zPosition = -1
        cardView.backgroundColor = UIColor.white
        cardView.layer.shadowColor = UIColor.gray.cgColor
        cardView.layer.shadowOpacity = 0.5
        cardView.layer.shadowOffset = .zero
        cardView.layer.shadowRadius = 10
        cardView.layer.cornerRadius = 10
    }
    
    func setup(exam: String, role: String, date: Int, name: String, healthy: Bool) {
        examLabel.text = exam
        roleLabel.text = role
        let stringifyDate = String(date)
        let formatDate = stringifyDate[..<stringifyDate.index(stringifyDate.startIndex, offsetBy: 10)]
        let date = Date(timeIntervalSince1970: Double(formatDate) ?? 0)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT-3")
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateLabel.text = dateFormatter.string(from: date)
        nameLabel.text = name
        
        statusImage.image = UIImage(named: healthy ? "check" : "wrong")
    }
}
