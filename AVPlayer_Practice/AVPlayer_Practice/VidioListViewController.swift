//
//  VidioListViewController.swift
//  AVPlayer_Practice
//
//  Created by t2023-m0026 on 1/25/24.
//

import UIKit
import SnapKit

class VidioListViewController: UIViewController {
    
    let videoTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func autoLayout() {
        videoTableView.snp.makeConstraints() { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }


}

#Preview{
    VidioListViewController()
}
