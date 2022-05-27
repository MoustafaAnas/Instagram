//
//  ViewController.swift
//  Instagram
//
//  Created by Moustafa Anas on 18/05/2022.
//

import FirebaseAuth
import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var homeTV: UITableView!
    
    var feedRenderModels = [HomeFeedRenderViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        createMockModels()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    // Check Auth Status
       checkAuthentication()
    }
    
    private func checkAuthentication(){
        if Auth.auth().currentUser == nil {
            let loginVC = UIStoryboard(name: "Onboarding", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
        }
    }

    func createMockModels() {
        let user = User(username: "Joe", bio: "i am joe", name: (first: "", last: ""), profilePicture: URL(string: "https://www.google.com")!, birthDate: Date(), gender: .male, counts: UserCount(followers: 1, following: 1, posts: 1), joinDate: Date())
        
        let post = UserPost(identefier: "", postType: .photo, thumbnailImage: URL(string: "https://www.google.com")!, postUrl: URL(string: "https://www.google.com")!, caption: nil, likeCount: [], comment: [], createdDate: Date(), taggedUsers: [], owner: user)
        
        var comments = [PostComment]()
        for x in 0...2 {
            var comment = PostComment(identefier: "123_/=\(x)", username: "@joe", text: "good post", createdDate: Date(), likes: [])
            comments.append(comment)
        }
        
        for x in 0...4 {
            let viewModel = HomeFeedRenderViewModel(header: PostRenderViewModel(renderType: .header(provider: user)), post: PostRenderViewModel(renderType: .primaryContent(provider: post)), actions: PostRenderViewModel(renderType: .actions(provider: "")), comments: PostRenderViewModel(renderType: .comments(comments: comments)))
            feedRenderModels.append(viewModel)
        }
    }
}





