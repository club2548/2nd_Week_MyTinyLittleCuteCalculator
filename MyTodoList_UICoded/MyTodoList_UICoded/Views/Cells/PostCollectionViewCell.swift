//
//  PostCollectionViewCell.swift
//  MyTodoList_UICoded
//
//  Created by t2023-m0026 on 1/29/24.
//

import Foundation
import UIKit

class PostCollectionViewCell : UICollectionViewCell {
    
    static let reuseIdentifier = "PostCollectionViewCell"
    
    let postThumbnail: UIImageView = {
        let picture = UIImageView()
        picture.contentMode = .scaleAspectFill
        picture.clipsToBounds = true
        return picture
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        contentView.addSubview(postThumbnail)
    }
    
    private func setupConstraints() {
        postThumbnail.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postThumbnail.topAnchor.constraint(equalTo: contentView.topAnchor),
            postThumbnail.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postThumbnail.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postThumbnail.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func setPostCollectionViewCell(thumbnailImage: UIImage) {
        postThumbnail.image = thumbnailImage
    }
}
