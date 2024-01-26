//
//  VideoListViewController.swift
//  AVPlayer_Practice
//
//  Created by t2023-m0026 on 1/25/24.
//

import UIKit
import SnapKit

class VideoListViewController: UIViewController {
    
    var remoteVideoInformation : [VideoInformation] = []
    
    let videoTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(videoTableView)
        videoTableView.delegate = self
        videoTableView.dataSource = self
        videoTableView.register(VideoListCell.self, forCellReuseIdentifier: VideoListCell.reuseIdentifier)
        showVideoList()
        autoLayout()
    }
    
    private func autoLayout() {
        videoTableView.snp.makeConstraints() { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(50)
        }
    }


}

extension VideoListViewController {
    private func showVideoList() {
        URLManager.shared.fetchVideoInformation { information in
            self.remoteVideoInformation = information
            DispatchQueue.main.async {
                self.videoTableView.reloadData()
            }
        }
    }
}

extension VideoListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        remoteVideoInformation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let videoListCell = tableView.dequeueReusableCell(withIdentifier: VideoListCell.reuseIdentifier, for: indexPath) as! VideoListCell
        let videoInfo = remoteVideoInformation[indexPath.row]
        videoListCell.setVideoList(
            thumnailVideoImage: videoListCell.thumnailImage ?? UIImage(),
            videoDuration: videoInfo.duration,
            videoTitle: videoInfo.title,
            videoAuthor: videoInfo.author,
            videoViews: "\(videoInfo.views)회",
            videoUploadTime: videoInfo.uploadTime.description
        )
        return videoListCell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
}

#Preview{
    VideoListViewController()
}
