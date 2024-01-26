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
    let thumnailUrl : URL
    let duration : String        // "8:18"
    let uploadTime : Date       // "May 9, 2011"
    let views : Int             // "24,969,123"
    let author : String
    let videoUrl : URL
    let description : String
    let subscriber : String     // "25254545 Subscribers"
    let isLive : Bool
}

class URLManager {
    // singleton 패턴
    static let shared = URLManager()
    
    // URL 생성 메서드
    func fetchVideoInformation(completion: @escaping ([VideoInformation]) -> Void) {
        
        // 리소스를 요청할 URL 생성. 주소가 nil이면 "잘못된 URL 주소입니다." 출력
        guard let url = URL(string: "https://gist.githubusercontent.com/poudyalanil/ca84582cbeb4fc123a13290a586da925/raw/14a27bd0bcd0cd323b35ad79cf3b493dddf6216b/videos.json") else {
            print("잘못된 URL 주소입니다.")
            return
        }
        
        // URLSessionDataTask를 사용하여 비동기적으로 데이터요청
        // URLSession의 dataTask 메소드에 url을 파라미터로 담아 데이터를 요청 -> data, response, error
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
                return
            } else if let data = data {
                do {
                    let information = try JSONDecoder().decode([VideoInformation].self, from: data)
                    completion(information)
                    // data가 nil이 아니면 do 구문을 통해서 JSON -> Model로 변환
                } catch {
                    print("Decode Error: \(error)")
                }
            }
        }
        // 네트워크 요청 시작
        task.resume()
    }
}
