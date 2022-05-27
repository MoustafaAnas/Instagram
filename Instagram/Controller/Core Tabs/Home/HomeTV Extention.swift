//
//  HomeTV Extention.swift
//  Instagram
//
//  Created by Moustafa Anas on 27/05/2022.
//

import UIKit

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        homeTV.delegate = self
        homeTV.dataSource = self
        homeTV.register(UINib(nibName: "IGFeedPostTVCell", bundle: nil) , forCellReuseIdentifier: "IGFeedPostTVCell")
        homeTV.register(UINib(nibName: "IGFeedPostGeneralTVCell", bundle: nil) , forCellReuseIdentifier: "IGFeedPostGeneralTVCell")
        homeTV.register(UINib(nibName: "IGFeedPostActionsTVCell", bundle: nil) , forCellReuseIdentifier: "IGFeedPostActionsTVCell")
        homeTV.register(UINib(nibName: "IGFeedPostHeaderTVCell", bundle: nil) , forCellReuseIdentifier: "IGFeedPostHeaderTVCell")
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return feedRenderModels.count * 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let model: HomeFeedRenderViewModel
        
        if section == 0 {
             model = feedRenderModels[0]
        } else {
            let position = section % 4 == 0 ? section/4 : ((section - (section % 4)) / 4)
            model = feedRenderModels[position]
        }
        
       let subSection = section % 4
        if subSection == 0 {
            // header
            return 1
        }
        else if subSection == 1 {
            // post
            return 1
        }
        else if subSection == 2 {
            // actions
            return 1
        }
        else if subSection == 3 {
            // comments
            let commentModel = model.comments
            switch commentModel.renderType {
                case .comments(let comments): return comments.count > 2 ? 2 : comments.count
            case .header, .primaryContent, .actions: return 0
            }
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model: HomeFeedRenderViewModel
        let section = indexPath.section
        
        if section == 0 {
             model = feedRenderModels[0]
        } else {
            let position = section % 4 == 0 ? section/4 : ((section - (section % 4)) / 4)
            model = feedRenderModels[position]
        }
        
        let subSection = section % 4
         if subSection == 0 {
             // header
             let headerModel = model.header
             switch headerModel.renderType {
             case .header(let provider):
                 let cell = tableView.dequeueReusableCell(withIdentifier: "IGFeedPostHeaderTVCell", for: indexPath) as! IGFeedPostHeaderTVCell
                 cell.configureCell(with: provider)
                 cell.delegate = self
                 return cell
             case .comments, .primaryContent, .actions: return UITableViewCell()
             }
         }
         else if subSection == 1 {
             // post
             let postModel = model.post
             switch postModel.renderType {
             case .primaryContent(let post):
                 let cell = tableView.dequeueReusableCell(withIdentifier: "IGFeedPostTVCell", for: indexPath) as! IGFeedPostTVCell
                 cell.configureCell(with: post)
                 return cell
             case .comments, .header, .actions: return UITableViewCell()
             }
         }
         else if subSection == 2 {
             // actions
             let actionsModel = model.actions
             switch actionsModel.renderType {
             case .actions(let provider):
                 let cell = tableView.dequeueReusableCell(withIdentifier: "IGFeedPostActionsTVCell", for: indexPath) as! IGFeedPostActionsTVCell
                // cell.configurCell(with: provider)
                 cell.delegate = self
                 return cell
             case .comments, .primaryContent, .header: return UITableViewCell()
             }
         }
         else if subSection == 3 {
             // comments
             let commentsModel = model.comments
             switch commentsModel.renderType {
             case .comments(let comments):
                 let cell = tableView.dequeueReusableCell(withIdentifier: "IGFeedPostGeneralTVCell", for: indexPath) as! IGFeedPostGeneralTVCell
                 cell.configureCell(with: comments, indexPath: indexPath.row)
                 return cell
             case .header, .primaryContent, .actions: return UITableViewCell()
             }
         }
        else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let subSection = indexPath.section % 4
        
        if subSection == 0 {
            //header
            return 70
        }
        else if subSection == 1 {
            //post
            return tableView.frame.width
        }
        else if subSection == 2 {
            //actions
            return 60
        }
        else if subSection == 3 {
            //comments
            return 50
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let subSection = section % 4
        return subSection == 3 ? 10 : 0
    }
}
