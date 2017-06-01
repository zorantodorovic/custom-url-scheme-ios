//
//  MainViewController.swift
//  CustomURLSchemeApp
//
//  Created by Zoran Todorovic on 01/06/2017.
//  Copyright © 2017 Zoran Todorovic. All rights reserved.
//

import UIKit
import PureLayout

class MainViewController: UIViewController {
    
    var queriesArray: [String]
    
    let tableView = UITableView(frame: CGRect.zero, style: .grouped)
    var tableViewData = [(String, String)]()
    let cellId = "cellId"
    
    init(queries: [String]) {
        self.queriesArray = queries
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.parseQueryData()
    }
    
    private func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.view.addSubview(tableView)
        self.tableView.autoPinEdgesToSuperviewEdges()
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 50
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    private func parseQueryData() {
        for query in self.queriesArray {
            let splitted = query.characters.split{ $0 == "=" }.map(String.init)
            let title = splitted[0]
            let value = splitted[1]
            self.tableViewData.append( (title , value) )
        }
        self.tableView.reloadData()
    }

}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return queriesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let data = tableViewData[indexPath.row]
        cell.textLabel?.text = "\(data.0): \(data.1)"
        return cell
        
    }
    
}

