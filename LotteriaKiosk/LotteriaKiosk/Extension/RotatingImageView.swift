//
//  RotatingImageView.swift
//  LotteriaKiosk
//
//  Created by t2023-m0026 on 1/2/24.
//

import UIKit

protocol RotatingImagesViewDelegate: AnyObject {
    func didSelectImageAtIndex(index: Int)
}

var rotatingImagesView: RotatingImagesView!

class RotatingImagesView: UIView {
    weak var delegate: RotatingImagesViewDelegate?
    
    var collectionView: UICollectionView!
    var imageIndex = 0
    var timer: Timer?
    
    var images: [UIImage] = []  // 이미지 배열을 저장하는 프로퍼티 추가

    init(images: [UIImage]) {
        super.init(frame: .zero)
        self.images = images
        setupCollectionView()
        startImageRotationTimer()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "ImageCell")
        addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func startImageRotationTimer() {
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(rotateImages), userInfo: nil, repeats: true)
    }

    @objc private func rotateImages() {
        if imageIndex < images.count {
            collectionView.scrollToItem(at: IndexPath(item: imageIndex, section: 0), at: .centeredHorizontally, animated: true)
            imageIndex += 1
        } else {
            imageIndex = 0
        }
    }
}

extension RotatingImagesView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCollectionViewCell
        cell.imageView.image = images[indexPath.item]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: bounds.height)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectImageAtIndex(index: indexPath.item)
    }
}

class ImageCollectionViewCell: UICollectionViewCell {
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
