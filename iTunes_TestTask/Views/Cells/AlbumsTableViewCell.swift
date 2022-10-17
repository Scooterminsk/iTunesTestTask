//
//  AlbumsTableViewCell.swift
//  iTunes_TestTask
//
//  Created by Zenya Kirilov on 7.10.22.
//

import UIKit

class AlbumsTableViewCell: UITableViewCell {
    
    private let albumLogo: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let albumNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Name album name"
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let artistNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Name artist name"
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let trackCountLabel: UILabel = {
       let label = UILabel()
        label.text = "16 tracks"
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var stackView = UIStackView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        albumLogo.layer.cornerRadius = albumLogo.frame.width / 2
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
                
        stackView = UIStackView(arrangedSubviews: [artistNameLabel,trackCountLabel],
                                axis: .horizontal,
                                spacing: 10,
                                distribution: .equalCentering)
       
        addSubview(albumLogo)
        addSubview(albumNameLabel)
        addSubview(stackView)
    }
    
    func configureCell(album: Album) {
    
        if let urlString = album.artworkUrl100 {
            NetworkRequest.shared.requestData(urlString: urlString) { [weak self] result in
                switch result {
                case .success(let data):
                    let image = UIImage(data: data)
                    self?.albumLogo.image = image
                case .failure(let error):
                    self?.albumLogo.image = nil
                    print("Error occured while trying to get a logo image" + error.localizedDescription)
                }
            }
        } else {
            albumLogo.image = nil
        }
        
        albumNameLabel.text = album.collectionName
        artistNameLabel.text = album.artistName
        trackCountLabel.text = "\(album.trackCount) tracks"
    }
    
}

//MARK: - SetConstraints

extension AlbumsTableViewCell {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            albumLogo.centerYAnchor.constraint(equalTo: centerYAnchor),
            albumLogo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            albumLogo.heightAnchor.constraint(equalToConstant: 60),
            albumLogo.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            albumNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            albumNameLabel.leadingAnchor.constraint(equalTo: albumLogo.trailingAnchor, constant: 10),
            albumNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: albumLogo.trailingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}
