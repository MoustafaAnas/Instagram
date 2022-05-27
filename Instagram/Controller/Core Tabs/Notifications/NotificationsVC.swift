//
//  NotificationsVC.swift
//  Instagram
//
//  Created by Moustafa Anas on 18/05/2022.
//

import UIKit


final class NotificationsVC: UIViewController {

    @IBOutlet weak var notificationsTV: UITableView!
    
    private lazy var noNotificationsView = NoNotificationsView()
    var models = [UserNotification]()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.tintColor = .label
        return spinner
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Notifications"
        fetchNotifications()
        view.addSubview(spinner)
        //spinner.startAnimating()
        setupTableView()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        spinner.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        spinner.center = view.center
    }

    private func addNotificationsView() {
        notificationsTV.isHidden = true
        view.addSubview(noNotificationsView)
        noNotificationsView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width/2, height: self.view.frame.width/4)
        noNotificationsView.center = view.center
    }
    
    private func fetchNotifications() {
        
        let user = User(username: "Joe", bio: "i am joe", name: (first: "", last: ""), profilePicture: URL(string: "https://www.google.com")!, birthDate: Date(), gender: .male, counts: UserCount(followers: 1, following: 1, posts: 1), joinDate: Date())
        
        let post = UserPost(identefier: "", postType: .photo, thumbnailImage: URL(string: "https://www.google.com")!, postUrl: URL(string: "https://www.google.com")!, caption: nil, likeCount: [], comment: [], createdDate: Date(), taggedUsers: [], owner: user)
        
        for x in 0...100 {
            
            let model = UserNotification(type: x % 2 == 0 ? .follow(state: .not_following): .like(post: post), notificationText: "Hello World", user: user)
            
            models.append(model)
        }
    }

}






