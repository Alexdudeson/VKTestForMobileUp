//
//  GalleryViewController.swift
//  VKTestForMobileUp
//
//  Created by Alexey Yarov on 02.04.2022.
//


import SwiftyVK
import UIKit
import WebKit

// Чтобы работало, сделал вебвью :(

class GalleryViewController: UIViewController {

    let galleryView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(galleryView)
        self.navigationItem.title = "Mobile Up Gallery"
//          self.navigationItem.setHidesBackButton(true, animated: true)
//          Если мы хотим убрать стандартную кнопку назад из навигации
        
        
        guard let albumUrl = URL(string: "https://vk.com/album-128666765_266276915")
        else { return
        }
        galleryView.load(URLRequest(url: albumUrl))

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        galleryView.frame = view.bounds
    }

    
    
    // Кнопка выхода из аккаунта с оповещением
    
    @IBAction func logOutButton(_ sender: UIButton) {
        let alert = UIAlertController(
          title: "Вы Вышли из VKontakte",
          message: "Ждем Вас снова!",
          preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default))
        self.present(alert, animated: true, completion: nil)
        
        // После срабатывания кнопки, пользователь выходит из аккаунта. Но есть нюансы
        VK.sessions.default.logOut()
        }
    }

    
    
    
    
  // Наработка для кастомизации альбома

struct AlbumResponse: Codable {
    let response: Album
}


struct Album: Codable {
    let count: Int
    let items: [PhotosModel]
}

struct PhotosModel: Codable {
    let date: Int
    let id: Int
    let sizes: [Size]
}

struct Size: Codable {
    let type: String
    let url: String
}



//class AlbumPhotosCollectionViewCell: UICollectionViewCell {
//
//    static let identifire = "AlbumPhotosCollectionViewCell"
//
//    private let imageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true
//        return imageView
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        contentView.addSubview(imageView)
//        makeConstraints()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        imageView.image = nil
//    }
//
//    private func makeConstraints() {
//        imageView.image { (make) in
//            make.center.width.height.equalToSuperview()
//        }
//    }
//
//    public func configure(with model: AlbumPhotosViewModel) {
//        imageView.sd_setImage(with: model.url, placeholderImage: UIImage(systemName: "photo"))
//    }
//}



