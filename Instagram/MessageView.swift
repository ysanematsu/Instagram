//
//  MessageView.swift
//  Instagram
//
//  Created by 實松保雄 on 2020/07/29.
//  Copyright © 2020 ysanematsu. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class MessageView: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    //HomeViewControllerからidを受け取るための変数
    var x: PostData!
    
   //課題：送信ボタンを押して、コメントをFirebaseに送信
    @IBAction func commentPost(_ sender: Any) {

        //HomeViewControllerから受け取ったidをpostDataに代入
        let postData = x
        
        //HomeViewcontrollerで取得したidを指定してコメントを送信
        let updateComment = textField.text
        
        let user = Auth.auth().currentUser
        let updateUserName = user?.displayName
        
        let updateCommentValue = FieldValue.arrayUnion([updateComment as Any])
        let updateUserValue = FieldValue.arrayUnion([updateUserName as Any])
        
        let postRef = Firestore.firestore().collection(Const.PostPath).document(postData!.id)
        postRef.updateData(["comment": updateCommentValue, "commentUser": updateUserValue])
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        // 画面を閉じる
        self.dismiss(animated: true, completion: nil)
    }
}
