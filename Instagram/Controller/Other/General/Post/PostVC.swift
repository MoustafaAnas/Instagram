//
//  PostVC.swift
//  Instagram
//
//  Created by Moustafa Anas on 18/05/2022.
//

import UIKit


class PostVC: UIViewController {

    @IBOutlet weak var postTV: UITableView!
    var model: UserPost?
    var renderModels = [PostRenderViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        configureModels()
    }
    
    private func configureModels() {
        guard let userPostModel = self.model else {return}
        
        // Header
        renderModels.append(PostRenderViewModel(renderType: .header(provider: userPostModel.owner)))
        
        // Post
        renderModels.append(PostRenderViewModel(renderType: .primaryContent(provider: userPostModel)))
        
        // Actions
        renderModels.append(PostRenderViewModel(renderType: .actions(provider: "")))
                            
        // Comments
        var comments = [PostComment]()
        for x in 0...4 {
            comments.append(PostComment(identefier: "123_\(x)", username: "@dave", text: "good post", createdDate: Date(), likes: []))
        }
        renderModels.append(PostRenderViewModel(renderType: .comments(comments: comments)))
    }


}

