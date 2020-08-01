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
    var x: String?
    
   //課題：送信ボタンを押して、コメントをFirebaseに送信
    @IBAction func commentPost(_ sender: UIButton, forEvent event: UIEvent) {
    
        //HomeViewControllerから受け取ったidをpostDataに代入
        var postData = x
        
        //HomeViewcontrollerで取得したidを指定してコメントを送信
        let updatetest = textField.text
        let postRef = Firestore.firestore().collection(Const.PostPath).document(postData.id)
        postRef.updateData(["comment": updatetest])
        
    }
}
