//
//  AlbumsViewController.swift
//  iTunes_TestTask
//
//  Created by Zenya Kirilov on 6.10.22.
//

import UIKit

class AlbumsViewController: UIViewController {
    
    private let tableView: UITableView = {
       let tableView = UITableView()
        tableView.register(AlbumsViewController.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupDelegates()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(tableView)
    }
    
    private func setupDelegates() {
        
    }
    
    private func setNavigationBar() {
       
    }

}

extension AlbumsViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
        ])
        
    }
}
