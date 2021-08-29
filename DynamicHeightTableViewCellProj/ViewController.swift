//
//  ViewController.swift
//  BtnTableViewCellProj
//
//  Created by Sandeep Kumar on 26/08/21.
//

import UIKit

class ViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        // Registering DynamicHeightTableViewCell
        // We need to do this inorder to be able to dequeueCells and for the OS to know
        // what cell to use.
        tableView.register(DynamicHeightTableViewCell.self,
                           forCellReuseIdentifier: DynamicHeightTableViewCell.reuseIdentifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Adding a title to the main Page
        // largeTitleDisplayMode allows larger out-of-line title is displayed
        title = "Table Cell"
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate(staticConstraints())
    }
    
    private func staticConstraints() -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(contentsOf: [
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant:100)
        ])
        return constraints
    }
}

// MARK: TableViewDelegate, TableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DynamicHeightTableViewCell.reuseIdentifier,
                                                 for: indexPath) as? DynamicHeightTableViewCell
        else {
            return UITableViewCell()
        }
        let dataObject = DataSet.data[indexPath.row]
        cell.configureCell(with: dataObject.title, subtitle: dataObject.subtitle)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataSet.data.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}


