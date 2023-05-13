//
//  PhotoCollectionViewCell.swift
//  BunnyNest
//
//  Created by Furkan Erdoğan on 13.05.2023.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    static let identifier = "PhotoCellİndentifier"
    
     var imageView: UIImageView = {
        let iv = UIImageView()
         iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        
        return iv
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
