//
//  Enums.swift
//  Instagram
//
//  Created by Moustafa Anas on 27/05/2022.
//

import Foundation

/// Gender Type
public enum Gender {
    case male, female
}

/// User Post Type
public enum UserPostType: String {
    case photo = "Photo"
    case video = "Video"
}

/// states of rendered cell
enum PostRenderType {
    case header(provider: User)
    case primaryContent(provider: UserPost)
    case actions(provider: String)
    case comments(comments: [PostComment])
}

/// Settings Url Type
enum SettingsURLType {
    case terms, privacy, help
}

/// Following/Unfollowing State
enum FollowState {
    case following // indicates whether the current user is following the other user
    case not_following // indicates whether the current user is not following the other user
}

/// Notification Type
enum UserNotificationType {
    case like(post: UserPost)
    case follow(state: FollowState)
}
