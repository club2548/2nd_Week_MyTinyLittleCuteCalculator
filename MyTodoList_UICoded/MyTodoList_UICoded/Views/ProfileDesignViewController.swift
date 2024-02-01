//
//  ProfileDesignViewController.swift
//  MyTodoList_UICoded
//
//  Created by t2023-m0026 on 1/26/24.
//

import UIKit

class ProfileDesignViewController: UIViewController {
    
    let userName: UILabel = {
        let text = UILabel()
        text.text = "nabaecamp"
        text.font = .systemFont(ofSize: 18, weight: .bold)
        return text
    }()
    
    let menuButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "line.3.horizontal"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    let userPic: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Ellipse 1")
        return imageView
    }()
    // 88 * 88
    
    let postsLabel: UILabel = {
        let text = UILabel()
        text.text = "post"
        text.font = .systemFont(ofSize: 14, weight: .regular)
        return text
    }()
    let postsNum: UILabel = {
        let text = UILabel()
        text.text = "1"
        text.font = .systemFont(ofSize: 16.5, weight: .semibold)
        return text
    }()
    
    let followersLabel: UILabel = {
        let text = UILabel()
        text.text = "follower"
        text.font = .systemFont(ofSize: 14, weight: .regular)
        return text
    }()
    let followersNum: UILabel = {
        let text = UILabel()
        text.text = "2"
        text.font = .systemFont(ofSize: 16.5, weight: .semibold)
        return text
    }()
    
    let followingLabel: UILabel = {
        let text = UILabel()
        text.text = "following"
        text.font = .systemFont(ofSize: 14, weight: .regular)
        return text
    }()
    let followingNum: UILabel = {
        let text = UILabel()
        text.text = "3"
        text.font = .systemFont(ofSize: 16.5, weight: .semibold)
        return text
    }()
    
    let userInfoView : UIView = {
        let userinfo = UIView()
        return userinfo
    }()
    
    let titleLabel: UILabel = {
        let text = UILabel()
        text.text = "르탄이"
        text.font = .systemFont(ofSize: 14, weight: .semibold)
        return text
    }()
    
    let descriptionLabel: UILabel = {
        let text = UILabel()
        text.text = "iOS Developer 🍎"
        text.font = .systemFont(ofSize: 14, weight: .regular)
        return text
    }()
    
    let homepageLabel: UILabel = {
        let text = UILabel()
        text.text = "spartacodingclub.kr"
        text.font = .systemFont(ofSize: 14, weight: .regular)
        return text
    }()
    
    
    let followButton: UIButton = {
        let button = UIButton()
        button.setTitle("Follow", for: .normal)
        button.titleLabel?.font = UIFont(name: "OpenSans-Bold", size: 5)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        return button
    }()
    
    let messageButton: UIButton = {
        let button = UIButton()
        button.setTitle("Message", for: .normal)
        button.titleLabel?.font = UIFont(name: "OpenSans-Bold", size: 14)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
        button.layer.cornerRadius = 4
        return button
    }()
    
    let showMoreButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.tintColor = .black
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
        button.layer.cornerRadius = 4
        return button
    }()
    
    lazy var postCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let itemSizeWidthHeight = (UIScreen.main.bounds.width - 4) / 3
        layout.itemSize = CGSize(width: itemSizeWidthHeight, height: itemSizeWidthHeight)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: PostCollectionViewCell.reuseIdentifier)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        addSubViews()
        autoLayout()
        setupInteractions()
    }
    
    private func addSubViews() {
        self.view.addSubViews([userName, menuButton, userPic, postsLabel, postsNum, followersLabel, followersNum, followingLabel, followingNum, titleLabel, descriptionLabel, homepageLabel, followButton, messageButton, showMoreButton, postCollectionView, userInfoView])
        userInfoView.addSubview(postsLabel)
        userInfoView.addSubview(postsNum)
        userInfoView.addSubview(followersNum)
        userInfoView.addSubview(followersLabel)
        userInfoView.addSubview(followingNum)
        userInfoView.addSubview(followingLabel)
    }
    
    private func autoLayout() {
        
        userName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userName.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            userName.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 5)
        ])
        
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuButton.topAnchor.constraint(equalTo: userName.topAnchor),
            menuButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        ])
        
        userPic.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userPic.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 14),
            userPic.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16)
        ])  // 88 * 88
        
        userInfoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userInfoView.leadingAnchor.constraint(equalTo: userPic.trailingAnchor, constant: 55),
            userInfoView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -56),
            userInfoView.centerYAnchor.constraint(equalTo: userPic.centerYAnchor, constant: 0),
            userInfoView.heightAnchor.constraint(equalToConstant: 41)
        ])
        
        followingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            followingLabel.centerXAnchor.constraint(equalTo: userInfoView.leadingAnchor, constant: 0),
            followingLabel.bottomAnchor.constraint(equalTo: userInfoView.bottomAnchor, constant: 0)
        ])
        
        followingNum.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            followingNum.centerXAnchor.constraint(equalTo: userInfoView.leadingAnchor, constant: 0),
            followingNum.topAnchor.constraint(equalTo: userInfoView.topAnchor, constant: 0)
        ])
        
        postsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postsLabel.centerXAnchor.constraint(equalTo: userInfoView.centerXAnchor, constant: 0),
            postsLabel.bottomAnchor.constraint(equalTo: userInfoView.bottomAnchor, constant: 0)
        ])
        
        postsNum.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postsNum.centerXAnchor.constraint(equalTo: userInfoView.centerXAnchor, constant: 0),
            postsNum.topAnchor.constraint(equalTo: userInfoView.topAnchor, constant: 0)
        ])
        
        followersLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            followersLabel.centerXAnchor.constraint(equalTo: userInfoView.trailingAnchor, constant: 0),
            followersLabel.bottomAnchor.constraint(equalTo: userInfoView.bottomAnchor, constant: 0)
        ])
        
        followersNum.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            followersNum.centerXAnchor.constraint(equalTo: userInfoView.trailingAnchor, constant: 0),
            followersNum.topAnchor.constraint(equalTo: userInfoView.topAnchor, constant: 0)
        ])
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
            titleLabel.topAnchor.constraint(equalTo: userPic.bottomAnchor, constant: 14)
        ])
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10)
        ])
        
        homepageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            homepageLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0),
            homepageLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10)
        ])
        
        followButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            followButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
            followButton.trailingAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -23),
            followButton.topAnchor.constraint(equalTo: homepageLabel.bottomAnchor, constant: 11)
        ])
        
        messageButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messageButton.leadingAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -15),
            messageButton.trailingAnchor.constraint(equalTo: showMoreButton.leadingAnchor, constant: -8),
            messageButton.topAnchor.constraint(equalTo: followButton.topAnchor, constant: 0)
        ])
        
        showMoreButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            showMoreButton.widthAnchor.constraint(equalToConstant: 30),
            showMoreButton.heightAnchor.constraint(equalToConstant: 30),
            showMoreButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15),
            showMoreButton.topAnchor.constraint(equalTo: followButton.topAnchor, constant: 0)
        ])
        
        postCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postCollectionView.topAnchor.constraint(equalTo: followButton.bottomAnchor, constant: 0),
            postCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            postCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            postCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
        ])
    }
    
    private func setupInteractions() {
        
    }
    
    let listOfPic = [
        UIImage(named: "picture-0"),
        UIImage(named: "picture-1"),
        UIImage(named: "picture-2"),
        UIImage(named: "picture-3"),
        UIImage(named: "picture-4"),
        UIImage(named: "picture-5"),
        UIImage(named: "picture-6")
    ]
}

extension ProfileDesignViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("\(listOfPic.count)")
        return listOfPic.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.reuseIdentifier, for: indexPath) as? PostCollectionViewCell else { return UICollectionViewCell() }
        
        let nameOfPicture = listOfPic[indexPath.row]
        print("\(String(describing: nameOfPicture))")
        cell.setPostCollectionViewCell(thumbnailImage: nameOfPicture!)
        return cell
    }
}


extension UIView {
    func addSubViews(_ views : [UIView]){
        _ = views.map{self.addSubview($0)}
    }
}
