//
//  ViewController.swift
//  PageTransform
//
//  Created by 林暐潔 on 2016/11/19.
//  Copyright © 2016年 林暐潔. All rights reserved.
//

import UIKit

class Main: UIViewController {
    
    @IBOutlet weak var roleButton1: UIButton!
    @IBOutlet weak var roleButton2: UIButton!
    @IBOutlet weak var roleButton3: UIButton!
    
    var role = Role()
    
    var roleArray = [Role(index: 0, image: UIImage(named: "2"), name: "火槍手", rare: "稀有", type: "部隊", introduction: "三人一組，自立自強的霹靂嬌娃，他們為了正義和榮譽而戰。可千萬別失禮，如果惹到他們，只能說你自己找地雷踩！"),
                     Role(index: 1, image: UIImage(named: "3"), name: "地獄塔", rare: "稀有", type: "建築", introduction: "防禦建築，對目標造成火焰傷害會隨著時間而遞增。再大再強悍的敵人到了它面前都會灰飛煙滅！"),
                     Role(index: 2, image: UIImage(named: "4"), name: "雷電法術", rare: "史詩", type: "法術", introduction: "雷電法術最多可傷害和擊暈目標區域內三個生命值最高的敵軍或建築。對皇家塔的傷害會大打折扣")]
    
    @IBAction func inIntroduction(_ sender: UIButton) {

        self.performSegue(withIdentifier: "inIntroduction", sender: sender.tag)
        
//        let controller = self.storyboard?.instantiateViewController(withIdentifier: "IntroductionPage") as? IntroductionPage
//        self.present(controller!, animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = sender as! Int
        let controller = segue.destination as! IntroductionPage
        controller.role = roleArray[index]
    }
    
    func roleIntroduction(noti:Notification) {
        //接收編輯頁面回傳的資訊
        role = noti.userInfo!["PASS"] as! Role
        roleArray[role.index] = role
        
        //print("\(noti.userInfo!["PASS"] )")
        
//        set current title
        if role.index == 0 {
            roleButton1.setTitle(role.name, for: UIControlState.normal)
        }else if role.index == 1 {
            roleButton2.setTitle(role.name, for: UIControlState.normal)
        }else if role.index == 2 {
            roleButton3.setTitle(role.name, for: UIControlState.normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notificationName = Notification.Name("RoleIntroduction")
        NotificationCenter.default.addObserver(self, selector: #selector(roleIntroduction(noti:)), name: notificationName, object: nil)
        
        //更新頁面資訊
        roleButton1.setTitle(roleArray[0].name, for: .normal)
        roleButton2.setTitle(roleArray[1].name, for: .normal)
        roleButton3.setTitle(roleArray[2].name, for: .normal)
        

        roleButton1.layer.cornerRadius = 30
        roleButton2.layer.cornerRadius = 30
        roleButton3.layer.cornerRadius = 30
        
//        role += [musketeers, hellTower, lightning]
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

