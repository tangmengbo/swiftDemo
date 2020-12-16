//
//  BaseVC.swift
//  SwiftDemo
//
//  Created by 唐蒙波 on 2020/5/28.
//  Copyright © 2020 Meng. All rights reserved.
//

import Foundation
import UIKit

class BaseVC: UIViewController {
    
    let topHeight = TOP_STATUSBAR_HEIGHT+44
    
    var statusBarView : UIView!
    var navationView : UIView!
    var titleLable : UILabel!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        statusBarView = UIView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: TOP_STATUSBAR_HEIGHT))
        statusBarView.backgroundColor = UIColor.white
        self.view.addSubview(statusBarView)
        
        navationView = UIView.init(frame: CGRect(x: 0, y: statusBarView.frame.size.height, width: SCREEN_WIDTH, height: 44))
        navationView.backgroundColor = UIColor.white
        self.view.addSubview(navationView)
        
        titleLable = UILabel.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: navationView.frame.size.height))
        titleLable.font = UIFont.boldSystemFont(ofSize: 18*BiLiWidth)
        titleLable.textAlignment = NSTextAlignment.center
        navationView.addSubview(titleLable)
        
    }
}
