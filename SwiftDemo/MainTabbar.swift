//
//  MainTabbar.swift
//  SwiftDemo
//
//  Created by 唐蒙波 on 2020/5/28.
//  Copyright © 2020 Meng. All rights reserved.
//

import Foundation
import UIKit

class MainTabbar: UITabBarController {
    
    var bottomImageView : UIImageView!
    var button1 : UIButton!
    var button2 : UIButton!
    var button3 : UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for view in self.view.subviews {

            if (view as AnyObject).classForCoder == UITabBar.classForCoder() {
                view.isHidden = true
                break
            }
        }
        initTabbar()
    }
    
    func initTabbar()
    {
        bottomImageView = UIImageView.init(frame: CGRect(x: 0, y: SCREEN_HEIGHT-BOTTOM_TABBAR_HEIGHT, width: SCREEN_WIDTH, height:BOTTOM_TABBAR_HEIGHT))
        bottomImageView.isUserInteractionEnabled = true
        self.view.addSubview(bottomImageView)
        
        button1 = UIButton.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH/3, height: BOTTOM_TABBAR_HEIGHT))
        button1.backgroundColor = UIColor.red
        button1.tag = 0
        button1.addTarget(self, action: #selector(buttonClick(button :)), for: .touchUpInside)
        bottomImageView.addSubview(button1)
        
        button2 = UIButton.init(frame: CGRect(x: SCREEN_WIDTH/3, y: 0, width: SCREEN_WIDTH/3, height: BOTTOM_TABBAR_HEIGHT))
        button2.backgroundColor = UIColor.green
        button2.tag = 1
        button2.addTarget(self, action: #selector(buttonClick(button :)), for: .touchUpInside)
        bottomImageView.addSubview(button2)

        
        button3 = UIButton.init(frame: CGRect(x: SCREEN_WIDTH/3*2, y: 0, width: SCREEN_WIDTH/3, height: BOTTOM_TABBAR_HEIGHT))
        button3.backgroundColor = UIColor.green
        button3.tag = 2
        button3.addTarget(self, action: #selector(buttonClick(button :)), for: .touchUpInside)
        bottomImageView.addSubview(button3)

    }
    
    @objc func buttonClick(button : UIButton)
    {
     
        if button.tag==0
        {
            self.selectedIndex = 0
            button1.backgroundColor = UIColor.red
            button2.backgroundColor = UIColor.green
            button3.backgroundColor = UIColor.green
            
        }else if button.tag==1
        {
            self.selectedIndex = 1
            button1.backgroundColor = UIColor.green
            button2.backgroundColor = UIColor.red
            button3.backgroundColor = UIColor.green


        }
        else
        {
            self.selectedIndex = 2
            button1.backgroundColor = UIColor.green
            button2.backgroundColor = UIColor.green
            button3.backgroundColor = UIColor.red

        }
        
    }
}
