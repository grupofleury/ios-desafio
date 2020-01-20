//
//  ViewController.swift
//  testeFleury
//
//  Created by Tatiana Rico on 18/01/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var examesTableVIew: UITableView!
     
    var controller = ExameController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        getExame()
        
    }

    func setupTableView() {
        self.examesTableVIew.tableFooterView = UIView()
        self.examesTableVIew.delegate = self
        self.examesTableVIew.dataSource = self
        examesTableVIew.register(UINib(nibName: "ExameTableViewCell", bundle: nil), forCellReuseIdentifier: "ExameTableViewCell")
    }
    
    func getExame() {
        controller.getExame { (sucess) in
            if sucess{
                self.examesTableVIew.reloadData()
            }
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.numberOfItemsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = examesTableVIew.dequeueReusableCell(withIdentifier: "ExameTableViewCell", for: indexPath) as? ExameTableViewCell
        
        return cell ?? UITableViewCell()
    }
}
