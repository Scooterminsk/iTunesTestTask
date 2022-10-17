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
        tableView.register(AlbumsTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    var albums = [Album]()
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupDelegates()
        setConstraints()
        setNavigationBar()
        setupSearchController()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(tableView)
    }
    
    private func setupDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
        searchController.searchBar.delegate = self
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
    
    private func fetchAlbum(albumName: String) {
        let urlString = "https://itunes.apple.com/search?term=\(albumName)&entity=album&attribute=albumTerm"
        
        NetworkDataFetch.shared.fetchAlbum(urlString: urlString) { albumModel, error in
            
            if error == nil {
                guard let albumModel = albumModel else { return }
                if albumModel.results != [] {
                    let sortedAlbums = albumModel.results.sorted { firstItem, secondItem in
                        return firstItem.collectionName.compare(secondItem.collectionName) == ComparisonResult.orderedAscending
                    }
                    self.albums = sortedAlbums
                    self.tableView.reloadData()
                } else {
                    self.alertOk(title: "Error", message: "Add some words to continue searching")
                }
               
            } else {
                print(error!.localizedDescription)
            }
        }
    }
}

//MARK: - UITableViewDataSource

extension AlbumsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? AlbumsTableViewCell {
            let item = albums[indexPath.row]
            cell.configureCell(album: item)
            return cell
        }
        
        return UITableViewCell()
    }
}

//MARK: - UITableViewDelegate

extension AlbumsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailAlbumVC = DetailAlbumViewController()
        self.present(detailAlbumVC, animated: true)
    }
}

//MARK: - UISearchBarDelegate

extension AlbumsViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block: { [weak self] _ in
                self?.fetchAlbum(albumName: searchText)
            })
        }
    }
}

//MARK: - SetConstraints

extension AlbumsViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
}
