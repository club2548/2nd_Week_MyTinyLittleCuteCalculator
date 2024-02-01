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
    static let reuseIdentifier = "VidioListCell"
    
    var thumbnailImageView : UIImageView!
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("Cell registered")
        thumbnailImageView = UIImageView()
        addSubviews()
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
//        addSubview(thumbnailImageView)
        contentView.addSubview(duration)
        contentView.addSubview(title)
        contentView.addSubview(author)
        contentView.addSubview(views)
        contentView.addSubview(uploadTime)
    }
    
    private func autoLayout() {
        thumbnailImageView.snp.makeConstraints() { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(thumbnailImageView).multipliedBy(9/16)
        }
        
        duration.snp.makeConstraints() { make in
            make.bottom.equalTo(thumbnailImageView).offset(-8)
            make.trailing.equalTo(thumbnailImageView).offset(8)
        }
        
        title.snp.makeConstraints() { make in
            make.top.equalTo(duration.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(8)
        }
        
        author.snp.makeConstraints() { make in
            make.top.equalTo(title.snp.bottom).offset(4)
            make.leading.equalToSuperview().offset(8)
        }
        
        views.snp.makeConstraints() { make in
            make.top.equalTo(title.snp.bottom).offset(4)
            make.leading.equalTo(author.snp.trailing).offset(8)
        }
        
        uploadTime.snp.makeConstraints() { make in
            make.top.equalTo(title.snp.bottom).offset(4)
            make.leading.equalTo(views.snp.trailing).offset(8)
            make.trailing.equalToSuperview().offset(-8)
        }
    }
    
    func setThumbnail(imageURL: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: imageURL), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.thumbnailImageView.contentMode = .scaleAspectFill
                    self?.thumbnailImageView.image = image
                }
            } else {
                DispatchQueue.main.async {
                    self?.thumbnailImageView.contentMode = .scaleAspectFill
                    self?.thumbnailImageView.tintColor = .lightGray
                    self?.thumbnailImageView.image = UIImage(named: "playButton")
                }
            }
        }
    }
    
    func setVideoList(videoDuration: String, videoTitle: String, videoAuthor: String, videoViews: String, videoUploadTime: String) {
        duration.text = videoDuration
        title.text = videoTitle
        author.text = videoAuthor
        views.text = videoViews
        uploadTime.text = videoUploadTime
    }
}
