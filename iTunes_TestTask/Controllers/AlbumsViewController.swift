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
        navigationItem.title = "Albums"
        
        navigationItem.searchController = searchController
        
        let userInfoButton = createCustomButton(selector: #selector(userInfoButtonTapped))
        navigationItem.rightBarButtonItem = userInfoButton
    }
    
    private func setupSearchController() {
        searchController.searchBar.placeholder = "Search"
        searchController.obscuresBackgroundDuringPresentation = false
    }

    @objc func userInfoButtonTapped() {
        let userInfoVC = UserInfoViewController()
        self.present(userInfoVC, animated: true)
    }
}

extension AlbumsViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
        ])
        
    }
}
