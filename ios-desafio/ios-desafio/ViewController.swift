//
//  ViewController.swift
//  ios-desafio
//
//  Created by Renato Ruiz Cai on 11/06/21.
//  Copyright © 2021 Renato Ruiz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    var controller = Controller()
    @IBOutlet weak var examTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Desafio Fleury"
        
        searchBar.delegate = self
        
        examTableView.register(UINib(nibName: "CardCellTableViewCell", bundle: nil), forCellReuseIdentifier:
            "CardCellTableViewCell")
        examTableView.delegate = self
        examTableView.dataSource = self
        
        controller.fetchResults(completion: { (success, error) in
            if success {
                self.examTableView.reloadData()
            }
        })
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.filteredExamList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell: CardCellTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CardCellTableViewCell", for: indexPath) as? CardCellTableViewCell {
                cell.selectionStyle = .none
                let exam = controller.filteredExamList[indexPath.row]
                cell.setup(exam: exam.name, role: "Médico", date: exam.timestamp, name: exam.doctor, healthy: exam.healthy)
                return cell
            }
            return UITableViewCell()
    }
    
    // Whenever the text inside the search bar changes, execute the function below.
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        controller.filteredExamList = []
        
        if searchText == "" {
            controller.filteredExamList = controller.examList
        }else {
            for cell in controller.examList {
                if cell.doctor.lowercased().contains(searchText.lowercased()) ||
                    cell.name.lowercased().contains(searchText.lowercased()) {
                    controller.filteredExamList.append(cell)
                }
            }
        }
        
        self.examTableView.reloadData()
    }
}
