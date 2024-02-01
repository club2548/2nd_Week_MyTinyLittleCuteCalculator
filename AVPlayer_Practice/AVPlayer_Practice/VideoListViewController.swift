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
        videoTableView.delegate = self
        videoTableView.dataSource = self
        view.addSubview(videoTableView)
        autoLayout()
        fetchVideoInformation()
        videoTableView.register(VideoListCell.self, forCellReuseIdentifier: VideoListCell.reuseIdentifier)
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

extension VideoListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Number of rows: \(remoteVideoInformation.count)")
        return remoteVideoInformation.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Configuring cell for row \(indexPath.row)")
        let cell = tableView.dequeueReusableCell(withIdentifier: "VidioListCell", for: indexPath) as! VideoListCell
        
        let videoInfo = remoteVideoInformation[indexPath.row]
        
        
        cell.setThumbnail(imageURL: videoInfo.thumbnailUrl)
        cell.setVideoList(
            videoDuration: videoInfo.duration,
            videoTitle: videoInfo.title,
            videoAuthor: videoInfo.author,
            videoViews: "\(videoInfo.views)회",
            videoUploadTime: videoInfo.uploadTime.description
        )
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
}

extension VideoListViewController {
    // URL 생성 메서드
    func fetchVideoInformation() {
        
        // 리소스를 요청할 URL 생성. 주소가 nil이면 "잘못된 URL 주소입니다." 출력
        guard let url = URL(string: "https://gist.githubusercontent.com/poudyalanil/ca84582cbeb4fc123a13290a586da925/raw/14a27bd0bcd0cd323b35ad79cf3b493dddf6216b/videos.json")
        else {
            print("잘못된 URL 주소입니다.")
            return
        }
        
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let videoInfomationList = try JSONDecoder().decode([VideoInformation].self, from: data)
                print("Fetched video information: \(videoInfomationList)")
                
                await MainActor.run {
                    self.remoteVideoInformation = videoInfomationList
                    print("Updated remoteVideoInformation: \(remoteVideoInformation)")
                    self.videoTableView.reloadData()
                    print("Table view reloaded")
                }
            } catch {
                print("Error fetching video information: \(error)")
            }
        }
    }
}

#Preview{
    VideoListViewController()
}
