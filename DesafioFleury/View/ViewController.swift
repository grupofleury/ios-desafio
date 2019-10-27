//
//  ViewController.swift
//  DesafioFleury
//
//  Created by Camila Carvalho on 27/10/19.
//  Copyright © 2019 Camila Carvalho. All rights reserved.
//

import UIKit


class ViewController: UIViewController{
    
    var controller: ExamController?
    
    @IBOutlet weak var examTableView: UITableView!
    @IBOutlet weak var examSearch: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.examSearch.delegate = self
        
        self.examTableView.register(UINib(nibName: "ExamCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        self.controller = ExamController()
        self.examTableView.delegate = self
        self.examTableView.dataSource = self
        
        self.controller?.getListOfExams(completion: { (success, error) in
            if success {
                self.examTableView.reloadData()
            }
        })
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller?.numberOfRowsInSection() ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: ExamCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ExamCell {
            cell.setData(exam: controller?.loadCurrentExam(indexPath: indexPath))
            return cell
        }
        return UITableViewCell()
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        controller?.applyFilter(searchString: searchText)
       self.examTableView.reloadData()
    }
    
    
}

