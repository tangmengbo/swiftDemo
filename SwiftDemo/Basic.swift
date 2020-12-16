//
//  Basic.swift
//  SwiftDemo
//
//  Created by 唐蒙波 on 2020/5/26.
//  Copyright © 2020 Meng. All rights reserved.
//

import Foundation
import UIKit
import MJRefresh

class BasicVC: BaseVC, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    
    var mainscrollview : UIScrollView!
    var tableview1 : UITableView!
    var tableview2 : UITableView!
    var tableview3 : UITableView!
    
    var button1 : UIButton!
    var button2 : UIButton!
    var button3 : UIButton!
    
    var sourceArray1 = [NSDictionary]()
    var sourceArray2 = [NSDictionary]()
    var sourceArray3 = [NSDictionary]()
    
    var sliderView : UIView!
    
    lazy var button4 :UIButton = {
        
        weak var wealSelf = self
        let button = UIButton()
        button.frame = CGRect(x: 200, y: 200, width: 100, height: 100)
        button.setTitle("123", for: .normal)
        print("lazy jiazai")
        wealSelf?.view.addSubview(button)
        return button
        
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        var notificationDic : [String : Any] = NSDictionary.init() as! [String : Any]
        notificationDic["name"] = "张三"
        notificationDic["age"] = 18
        
        let age = notificationDic["age"]
        print(age)
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "NotificationTest"), object: notificationDic)

        
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
        titleLable.text = "hahaha"
        
        var array = [Any]()//声明数组
        
        array.append("张三")
        
        
        
        var dicInfo = [String : Any]()//声明字典
        dicInfo["name"] = "张三"
        dicInfo["age"] = 28

        
        for i in 0...30 {
            
            if i%3==0
            {
                let dic : [String : Any] = ["name" : "张三","age" : 21,"image" : "ad1"]
                
                sourceArray1.append(dic as NSDictionary)
                
            }else if i%3==1
            {
             
                let dic : [String : Any] = ["name" : "李四","age" : 31,"image" : "ad2"]
                
                sourceArray2.append(dic as NSDictionary)

            }else
            {
                let dic : [String : Any] = ["name" : "王五","age" : 41,"image" : "ad3"]
                
                sourceArray3.append(dic as NSDictionary)

            }
        }
        
        
        for (index,value) in array.enumerated().reversed() {//同时获取下标和值 reversed()倒叙输出
            
            print(index,value)
        }
        
        initContentView(array: array as NSArray)
    }
    
    func initContentView(array:NSArray)
    {
        button1 = UIButton.init(frame: CGRect(x: 0, y: 90, width: self.view.frame.size.width/3, height: 40))
        button1.addTarget(self, action: #selector(topButtonClick(button: )), for: .touchUpInside)
        button1.tag = 0
        button1.setTitleColor(UIColor.red, for: .normal)
        button1.setTitle("button1", for: .normal)
        button1.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        self.view.addSubview(button1)
        
        button2 = UIButton.init(frame: CGRect(x: button1.frame.origin.x+button1.frame.size.width, y: 90, width: self.view.frame.size.width/3, height: 40))
        button2.addTarget(self, action: #selector(topButtonClick(button: )), for: .touchUpInside)
        button2.tag = 1
        button2.setTitleColor(UIColor.red, for: .normal)
        button2.setTitle("button2", for: .normal)
        button2.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        self.view.addSubview(button2)

        
        button3 = UIButton.init(frame: CGRect(x: button2.frame.origin.x+button2.frame.size.width, y: 90, width: self.view.frame.size.width/3, height: 40))
        button3.addTarget(self, action: #selector(topButtonClick(button: )), for: .touchUpInside)
        button3.tag = 2
        button3.setTitleColor(UIColor.red, for: .normal)
        button3.setTitle("button3", for: .normal)
        button3.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        self.view.addSubview(button3)
        
        sliderView = UIView.init(frame: CGRect(x: (button1.frame.size.width-40)/2, y: button1.frame.origin.y+button1.frame.size.height-2, width: 40, height: 2))
        sliderView.backgroundColor = UIColor.purple
        sliderView.layer.cornerRadius = 1
        sliderView.layer.masksToBounds = true
        self.view.addSubview(sliderView)


        mainscrollview = UIScrollView.init(frame: CGRect(x: 0, y: 130, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-130))
        mainscrollview.contentSize = CGSize(width: CGFloat(array.count)*mainscrollview.frame.size.width, height: mainscrollview.frame.size.height)
        mainscrollview.delegate = self
        mainscrollview.tag = 1001
        self.view.addSubview(mainscrollview)
        
        tableview1 = UITableView.init(frame: CGRect(x: 0, y: 0, width: mainscrollview.frame.size.width, height: mainscrollview.frame.size.height))
        tableview1.delegate = self
        tableview1.dataSource = self
        tableview1.tag = 0
        mainscrollview.addSubview(tableview1)
        
        let header = MJRefreshNormalHeader.init(refreshingTarget: self, refreshingAction: #selector(refresh))
        tableview1.mj_header = header
        
        tableview2 = UITableView.init(frame: CGRect(x: mainscrollview.frame.size.width, y: 0, width: mainscrollview.frame.size.width, height: mainscrollview.frame.size.height))
        tableview2.delegate = self
        tableview2.dataSource = self
        tableview2.tag = 1
        mainscrollview.addSubview(tableview2)

        
        tableview3 = UITableView.init(frame: CGRect(x: mainscrollview.frame.size.width*2, y: 0, width: mainscrollview.frame.size.width, height: mainscrollview.frame.size.height))
        tableview3.delegate = self
        tableview3.dataSource = self
        tableview3.tag = 2
        mainscrollview.addSubview(tableview3)

        button4.isHidden = false
        button4.backgroundColor = Common.colorWithRGB(rgbValue: 0x333333)

        
    }
    @objc func refresh()
    {
        tableview1.mj_header?.endRefreshing()
    }
    @objc func topButtonClick(button : UIButton)
    {
        if button.tag==0 {
            
            
            UIView.animate(withDuration: 0.5, animations: {
                
                self.mainscrollview.contentOffset = CGPoint(x: button.tag*Int(self.mainscrollview.frame.size.width), y: 0)

                self.sliderView.frame = CGRect(x: (self.button1.frame.size.width-40)/2, y: self.sliderView.frame.origin.y, width: 40, height: 2)
                
            }) { (Bool) in
                
            }
            
        }else if button.tag==1
        {
            UIView.animate(withDuration: 0.5, animations: {
                
                self.mainscrollview.contentOffset = CGPoint(x: button.tag*Int(self.mainscrollview.frame.size.width), y: 0)
                self.sliderView.frame = CGRect(x: self.button2.frame.origin.x+(self.button1.frame.size.width-40)/2, y: self.sliderView.frame.origin.y, width: 40, height: 2)
                
            }) { (Bool) in
                
                if Bool==true
                {
                    
                }
            }
            
            
        }else
        {
            UIView.animate(withDuration: 0.5, animations: {
                
                self.mainscrollview.contentOffset = CGPoint(x: CGFloat(button.tag)*self.mainscrollview.frame.size.width, y: 0)
                self.sliderView.frame = CGRect(x: self.button3.frame.origin.x+(self.button3.frame.size.width-40)/2, y: self.sliderView.frame.origin.y, width: 40, height: 2)
                
            }) { (Bool) in
                
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView.tag==0 {
            
            return sourceArray1.count
            
        }else if tableView.tag==1
        {
            
            return sourceArray2.count
            
        }else
        {
            return sourceArray3.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        var cell: FirstCell? = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier") as? FirstCell
        if cell == nil {
            cell = FirstCell.init(style: .default, reuseIdentifier: "CellIdentifier")
        }
        let info :NSDictionary
        if tableView.tag==0 {
            
            info = sourceArray1[indexPath.row]
            
        }else if tableView.tag==1
        {
             info = sourceArray2[indexPath.row]
        }else
        {
             info = sourceArray3[indexPath.row]
        }
        cell?.selectionStyle = UITableViewCell.SelectionStyle.none
        cell?.initView(info: info);
        return cell!

    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        if scrollView.tag==1001 {
            
            let index : Int = Int(scrollView.contentOffset.x/scrollView.frame.size.width)
            
            switch index {
            case 0:
                button1.sendActions(for: .touchUpInside)
                
            case 1:
                
                button2.sendActions(for: .touchUpInside)

            case 2:
                button3.sendActions(for: .touchUpInside)

            default: break
                
            }
            
        }
    }
    
}
