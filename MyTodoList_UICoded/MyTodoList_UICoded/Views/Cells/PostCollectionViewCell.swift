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
    
    let postThumbnail : UIImageView = {
       let picture = UIImageView()
        return picture
    }()
    
    func setPostCollectionViewCell(thumbnailImage: UIImage) {
        postThumbnail.image = thumbnailImage
    }
}
