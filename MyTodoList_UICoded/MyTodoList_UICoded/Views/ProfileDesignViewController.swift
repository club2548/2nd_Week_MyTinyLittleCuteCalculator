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
    
    let postCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.backgroundColor = .blue
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
        self.view.addSubViews([userName, menuButton, userPic, postsLabel, postsNum, followersLabel, followersNum, followingLabel, followingNum, titleLabel, descriptionLabel, homepageLabel, followButton, messageButton, showMoreButton, postCollectionView])
        postCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: PostCollectionViewCell.reuseIdentifier)
        postCollectionView.delegate = self
        postCollectionView.dataSource = self
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
        
        followingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            followingLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -28),
            followingLabel.topAnchor.constraint(equalTo: followingNum.bottomAnchor, constant: 0)
        ])
        
        followingNum.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            followingNum.centerXAnchor.constraint(equalTo: followingLabel.centerXAnchor, constant: 0),
            followingNum.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 37)
        ])
        
        postsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postsLabel.leadingAnchor.constraint(equalTo: userPic.trailingAnchor, constant: 41),
            postsLabel.topAnchor.constraint(equalTo: followingLabel.topAnchor, constant: 0)
        ])
        
        postsNum.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postsNum.centerXAnchor.constraint(equalTo: postsLabel.centerXAnchor, constant: 0),
            postsNum.topAnchor.constraint(equalTo: followersNum.topAnchor, constant: 0)
        ])
        
        followersLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            followersLabel.centerXAnchor.constraint(equalTo: postsLabel.centerXAnchor, constant: (followingLabel.centerXAnchor.constraint(equalTo: postsLabel.centerXAnchor).constant) / 2),
            followersLabel.topAnchor.constraint(equalTo: followingLabel.topAnchor, constant: 0)
        ])
        
        followersNum.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            followersNum.centerXAnchor.constraint(equalTo: followersLabel.centerXAnchor, constant: 0),
            followersNum.topAnchor.constraint(equalTo: followingNum.topAnchor, constant: 0)
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
    
    let listOfPic = ["picture-0", "picturt-1", "picture-2", "picture-3", "picture-4", "picture-5", "picture-6"]
}

extension ProfileDesignViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("\(listOfPic.count)")
        return listOfPic.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.reuseIdentifier, for: indexPath) as! PostCollectionViewCell
        
        let nameOfPicture = listOfPic[indexPath.row]
        let picture = UIImage(named: nameOfPicture)
        cell.setPostCollectionViewCell(thumbnailImage: picture!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}


extension UIView {
    func addSubViews(_ views : [UIView]){
        _ = views.map{self.addSubview($0)}
    }
}
