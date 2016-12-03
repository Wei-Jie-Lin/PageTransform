//
//  EditPage.swift
//  PageTransform
//
//  Created by 林暐潔 on 2016/11/19.
//  Copyright © 2016年 林暐潔. All rights reserved.
//

import UIKit

class EditPage: UIViewController {
    
    @IBOutlet weak var rareImage: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var rareTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var introductionTextView: UITextView!
    
    var editRole = Role()
    
    
    @IBAction func finishButton(_ sender: Any) {
        
        //取畫面上的值
        editRole.name = nameTextField.text
        editRole.rare = rareTextField.text
        editRole.type = typeTextField.text
        editRole.introduction = introductionTextView.text
        
        //發送通知
        let notificationName = Notification.Name("RoleIntroduction")
        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: ["PASS":editRole])
        
        //回到前一頁
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    // 按空白處會隱藏編輯狀態
    func hideKeyboard(_ tapG:UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        rareImage.image = editRole.image
        nameTextField.text = editRole.name
        rareTextField.text = editRole.rare
        typeTextField.text = editRole.type
        introductionTextView.text = editRole.introduction
        
        
        // 增加一個觸控事件，收鍵盤。
        let tap = UITapGestureRecognizer(target: self, action: #selector(EditPage.hideKeyboard(_:)))
        // 加在最基底的 self.view 上
        self.view.addGestureRecognizer(tap)
        
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
