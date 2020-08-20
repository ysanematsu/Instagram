//
//  PostData.swift
//  Instagram
//
//  Created by 實松保雄 on 2020/07/27.
//  Copyright © 2020 ysanematsu. All rights reserved.
//

import UIKit
import Firebase

class PostData: NSObject {
    var id: String
    var name: String?
    var caption: String?
    var date: Date?
    var likes: [String] = []
    var isLiked: Bool = false
    var comment: [String] = []//課題
    var commentUser: [String] = [] //課題

    init(document: QueryDocumentSnapshot) {
        self.id = document.documentID

        let postDic = document.data()

        self.name = postDic["name"] as? String
        
        self.caption = postDic["caption"] as? String
        
        //課題
        if let comment = postDic["comment"] as? [String] {
           self.comment = comment
        }
        
        //課題
        if let commentUser = postDic["commentUser"] as? [String] {
            self.commentUser = commentUser
        }
        
        let timestamp = postDic["date"] as? Timestamp
        self.date = timestamp?.dateValue()

        if let likes = postDic["likes"] as? [String] {
            self.likes = likes
        }
        if let myid = Auth.auth().currentUser?.uid {
            // likesの配列の中にmyidが含まれているかチェックすることで、自分がいいねを押しているかを判断
            if self.likes.firstIndex(of: myid) != nil {
                // myidがあれば、いいねを押していると認識する。
                self.isLiked = true
            }
        }
    }
}
