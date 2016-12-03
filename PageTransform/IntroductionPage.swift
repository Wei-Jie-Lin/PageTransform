//
//  IntroductionPage.swift
//  PageTransform
//
//  Created by 林暐潔 on 2016/11/19.
//  Copyright © 2016年 林暐潔. All rights reserved.
//

import UIKit

class IntroductionPage: UIViewController {

    @IBOutlet weak var rareImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rareLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var introductionTextView: UITextView!
    
    var role = Role()
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! EditPage
        controller.editRole = role
    }
    //初始值
    func initial(){
        rareImage.image = role.image
        nameLabel.text = role.name
        rareLabel.text = role.rare
        typeLabel.text = role.type
        introductionTextView.text = role.introduction
    }
    //更新資訊
    func updateInfo(){
        rareImage.image = role.image
        nameLabel.text = role.name
        rareLabel.text = role.rare
        typeLabel.text = role.type
        introductionTextView.text = role.introduction
    }
    
    //接收通知及更新資訊的方法
    func roleIntroduction(noti:Notification) {
        role = noti.userInfo!["PASS"] as! Role
        updateInfo()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //接收通知。
        let notificationName = Notification.Name("RoleIntroduction")
        NotificationCenter.default.addObserver(self, selector: #selector(roleIntroduction(noti:)), name: notificationName, object: nil)
        
        initial()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
