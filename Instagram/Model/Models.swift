import UIKit

/// Represents User
struct User {
    
    let username: String
    let bio: String
    let name: (first: String, last: String)
    let profilePicture: URL
    let birthDate: Date
    let gender: Gender
    let counts: UserCount
    let joinDate: Date
}

/// User Properties
struct UserCount {
    let followers: Int
    let following: Int
    let posts: Int
}

/// Reperesnts a user post
public struct UserPost {
    let identefier: String
    let postType: UserPostType
    let thumbnailImage: URL
    let postUrl: URL
    let caption: String?
    let likeCount: [PostLike]
    let comment: [PostComment]
    let createdDate: Date
    let taggedUsers: [String]
    let owner: User
}

/// Like Post
struct PostLike {
    let username: String
    let postIdentifier: String
}

/// Like Comment
struct CommentLike {
    let username: String
    let commentIdentifier: String
}

/// Comment on Post
struct PostComment {
    let identefier: String
    let username: String
    let text: String
    let createdDate: Date
    let likes: [CommentLike]
}

/// model of rendered post
struct PostRenderViewModel {
    let renderType: PostRenderType
}

/// Settings Model
struct SettingsCellModel {
    let title: String
    let handler: (() -> Void)
}

/// Edit Profile Model
struct EditProfileFormModel {
    let label: String
    let placeholder: String
    var value: String?
}

/// User Relationship {follow - unfollow}
struct UserRelationship {
    let name: String
    let username: String
    let state: FollowState
}

/// Home Feed Model
struct HomeFeedRenderViewModel {
    let header: PostRenderViewModel
    let post: PostRenderViewModel
    let actions: PostRenderViewModel
    let comments: PostRenderViewModel
}

/// Notifications
struct UserNotification {
let type: UserNotificationType
let notificationText: String
let user: User
}

/// Constants
struct Constants {
    static let padding: CGFloat = 8
}
