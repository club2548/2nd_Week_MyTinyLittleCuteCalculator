//
//  VideoListCell.swift
//  AVPlayer_Practice
//
//  Created by t2023-m0026 on 1/25/24.
//

import Foundation
import UIKit
import SnapKit

class VideoListCell : UITableViewCell {
    static let identifier = "VidioListCell"
    
    let thumnailImage : UIImage? = nil
    
    let duration : UILabel = {
        let label = UILabel()
        return label
    }()
    
    let title : UILabel = {
        let label = UILabel()
        return label
    }()
    
    let author : UILabel = {
        let label = UILabel()
        return label
    }()
    
    let views : UILabel = {
        let label = UILabel()
        return label
    }()
    
    let uploadTime : UILabel = {
        let label = UILabel()
        return label
    }()
}
