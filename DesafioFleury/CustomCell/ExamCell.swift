//
//  ExamCell.swift
//  DesafioFleury
//
//  Created by Camila Carvalho on 27/10/19.
//  Copyright © 2019 Camila Carvalho. All rights reserved.
//

import UIKit

class ExamCell: UITableViewCell {

    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var examLabel: UILabel!
    @IBOutlet weak var resultHealthyImage: UIImageView!
    @IBOutlet weak var doctorNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        shadowView.layer.zPosition = -1
        shadowView.backgroundColor = UIColor.white
        shadowView.layer.shadowColor = UIColor.gray.cgColor
        shadowView.layer.shadowOpacity = 0.5
        shadowView.layer.shadowOffset = .zero
        shadowView.layer.shadowRadius = 10
        shadowView.layer.cornerRadius = 10
    }

    
    
    func setData(exam: ExamElement?) {
        self.examLabel.text = exam?.name
        self.doctorNameLabel.text = exam?.doctor
        let imageResult = exam?.healthy == true ? "positiveResultIcon" : "negativeIcon"
        self.resultHealthyImage.image = UIImage(named: imageResult)
        
        let numStr = String(exam?.timestamp ?? 0)
        let newStr = numStr[..<numStr.index(numStr.startIndex, offsetBy: 10)]
        let date = Date(timeIntervalSince1970: Double(newStr) ?? 0)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT-3")
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "dd/MM/yyyy"
        self.dateLabel.text = dateFormatter.string(from: date)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
