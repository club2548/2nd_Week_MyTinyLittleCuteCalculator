//
//  URLManager.swift
//  AVPlayer_Practice
//
//  Created by t2023-m0026 on 1/25/24.
//

import Foundation


struct VideoInformation: Codable {
    let id : String
    let title : String
    let thumbnailUrl : URL
    let duration : String       // "8:18"
    let uploadTime : Date       // "May 9, 2011"
    let views : String          // "24,969,123"
    let author : String
    let videoUrl : URL
    let description : String
    let subscriber : String     // "25254545 Subscribers"
    let isLive : Bool
    
    enum CodingKeys: String, CodingKey {
            case id, title, thumbnailUrl, duration, uploadTime, views, author, videoUrl, description, subscriber, isLive
        }
    
    private static let iso8601 : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, yyyy"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.thumbnailUrl = try container.decode(URL.self, forKey: .thumbnailUrl)
        self.duration = try container.decode(String.self, forKey: .duration)
//        self.uploadTime = try container.decode(String.self, forKey: .uploadTime)
        self.views = try container.decode(String.self, forKey: .views)
        self.author = try container.decode(String.self, forKey: .author)
        self.videoUrl = try container.decode(URL.self, forKey: .videoUrl)
        self.description = try container.decode(String.self, forKey: .description)
        self.subscriber = try container.decode(String.self, forKey: .subscriber)
        self.isLive = try container.decode(Bool.self, forKey: .isLive)
        
        let uploadTimeString = try container.decode(String.self, forKey: .uploadTime)
        
        if let date = Self.iso8601.date(from: uploadTimeString) {
            self.uploadTime = date
        } else {
            let context = DecodingError.Context(codingPath: [CodingKeys.uploadTime], debugDescription: "Date string does not match format expected by formatter.")
            throw DecodingError.dataCorrupted(context)
        }
    }
}

//class URLManager {
//    // singleton 패턴
//    static let shared = URLManager()
//    let videoInfoList = VideoListViewController()
//    
//    // URL 생성 메서드
//    func fetchVideoInformation(viewController: VideoListViewController) {
//        
//        // 리소스를 요청할 URL 생성. 주소가 nil이면 "잘못된 URL 주소입니다." 출력
//        guard let url = URL(string: "https://gist.githubusercontent.com/poudyalanil/ca84582cbeb4fc123a13290a586da925/raw/14a27bd0bcd0cd323b35ad79cf3b493dddf6216b/videos.json")
//        else {
//            print("잘못된 URL 주소입니다.")
//            return
//        }
//        
//        Task {
//            do {
//                let (data, _) = try await URLSession.shared.data(from: url)
//                let videoInfomationList = try JSONDecoder().decode([VideoInformation].self, from: data)
//                print("Fetched video information: \(videoInfomationList)")
//                
//                await MainActor.run {
//                    videoInfoList.remoteVideoInformation = videoInfomationList
//                    print("Updated remoteVideoInformation: \(videoInfoList.remoteVideoInformation)")
//                    videoInfoList.videoTableView.reloadData()
//                    print("Table view reloaded")
//                }
//            } catch {
//                print("Error fetching video information: \(error)")
//            }
//        }
//    }
//}
