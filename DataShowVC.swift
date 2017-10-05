//
//  DataShowVC.swift
//  
//
//  Created by appinventiv on 19/09/17.
//

import UIKit

class DataShowVC: UIViewController {
    
    var dictShow: [String: String] = [:]
    var keys = [String]()
    
    @IBOutlet weak var dataShowTableView: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let nibCell = UINib(nibName: "DataCell", bundle: nil)
        dataShowTableView.register(nibCell, forCellReuseIdentifier: "DataCellId")
        
        dataShowTableView.delegate = self
        dataShowTableView.dataSource = self
        
        
    }
    
}



extension DataShowVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DataCellId", for: indexPath) as? DataCell else {
            fatalError("unable to make Cell")
        }
        
        cell.keyLabel.text = keys[indexPath.row] + "is"
        cell.valueLabel.text = dictShow[keys[indexPath.row]]
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}






