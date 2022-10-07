//
//  SongsCollectionViewCell.swift
//  iTunes_TestTask
//
//  Created by Zenya Kirilov on 7.10.22.
//

import UIKit

class SongsCollectionViewCell: UICollectionViewCell {
    
    let nameSongLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        
        addSubview(nameSongLabel)
        
        NSLayoutConstraint.activate([
            nameSongLabel.topAnchor.constraint(equalTo: topAnchor),
            nameSongLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            nameSongLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            nameSongLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ])
    }
}

