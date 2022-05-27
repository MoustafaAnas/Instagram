//
//  PostTV Extention.swift
//  Instagram
//
//  Created by Moustafa Anas on 27/05/2022.
//

import UIKit


extension PostVC: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        postTV.delegate = self
        postTV.dataSource = self
        postTV.register(UINib(nibName: "IGFeedPostTVCell", bundle: nil) , forCellReuseIdentifier: "IGFeedPostTVCell")
        postTV.register(UINib(nibName: "IGFeedPostGeneralTVCell", bundle: nil) , forCellReuseIdentifier: "IGFeedPostGeneralTVCell")
        postTV.register(UINib(nibName: "IGFeedPostActionsTVCell", bundle: nil) , forCellReuseIdentifier: "IGFeedPostActionsTVCell")
        postTV.register(UINib(nibName: "IGFeedPostHeaderTVCell", bundle: nil) , forCellReuseIdentifier: "IGFeedPostHeaderTVCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return renderModels.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch renderModels[section].renderType {
        case .actions(_): return 1
        case .comments(let comments): return comments.count > 4 ? 4 : comments.count
        case .header(_): return 1
        case .primaryContent(_): return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = renderModels[indexPath.section]
        switch model.renderType {
        case .primaryContent(let provider):
            let cell = tableView.dequeueReusableCell(withIdentifier: "IGFeedPostTVCell", for: indexPath) as! IGFeedPostTVCell
            return cell
        case .header(let provider):
            let cell = tableView.dequeueReusableCell(withIdentifier: "IGFeedPostHeaderTVCell", for: indexPath) as! IGFeedPostHeaderTVCell
            return cell
        case .comments(let comments):
            let cell = tableView.dequeueReusableCell(withIdentifier: "IGFeedPostGeneralTVCell", for: indexPath) as! IGFeedPostGeneralTVCell
            return cell
        case .actions(let provider):
            let cell = tableView.dequeueReusableCell(withIdentifier: "IGFeedPostActionsTVCell", for: indexPath) as! IGFeedPostActionsTVCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = renderModels[indexPath.section]
        switch model.renderType {
        case .actions(_): return 60
        case .comments(_): return 50
        case .header(_): return 70
        case .primaryContent(_): return tableView.frame.width
        }

    }
}
