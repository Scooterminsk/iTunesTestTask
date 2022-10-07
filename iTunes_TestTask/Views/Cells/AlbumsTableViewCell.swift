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
    
}

//MARK: - SetConstraints

extension AlbumsTableViewCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
        ])
    }
}
