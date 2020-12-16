//
//  First.swift
//  SwiftDemo
//
//  Created by 唐蒙波 on 2020/5/25.
//  Copyright © 2020 Meng. All rights reserved.
//

import UIKit
import Foundation

class FirstViewController: BaseVC, UITableViewDelegate, UITableViewDataSource, FirstCellDelegate {
    
    
    
    var sourceArray = Array<NSDictionary>()
    
    func setSourceData()
    {
        for i in 0...10
        {
            let dic = NSMutableDictionary.init()
            dic.setValue(String.init(format: "%d", i), forKey: "name")
            dic.setValue("456", forKey: "image")
            dic.setValue(NSNumber.init(value: 99), forKey: "age")
            dic.setValue(1, forKey: "bug")
            sourceArray.append(dic)
        }
        print(sourceArray);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstDemo()
        setSourceData()
        
        self.titleLable.text = "FirstVC"
        self.view.backgroundColor = UIColor.green
        let mainTableView = UITableView(frame: CGRect(x: 0, y: self.topHeight, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-self.topHeight))
        mainTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        mainTableView.backgroundColor = UIColor.white
        self.view.addSubview(mainTableView)
        mainTableView.delegate = self
        mainTableView.dataSource = self
        if #available(iOS 11.0, *) {
            mainTableView.estimatedRowHeight = 0;
            mainTableView.estimatedSectionHeaderHeight = 0;
            mainTableView.estimatedSectionFooterHeight = 0;
            mainTableView.contentInsetAdjustmentBehavior = .never
        }

        NotificationCenter.default.addObserver(self, selector: #selector(getNotification(notification:)), name: NSNotification.Name(rawValue: "NotificationTest"), object: nil)
        
    }
    @objc func getNotification(notification:NSNotification)
    {
        let notifiactionDic : NSDictionary! = notification.object as? NSDictionary
        
        let age: Int! = notifiactionDic?["age"] as? Int

        let alertControl = UIAlertController.init(title: "用户信息", message: String.init(format: "%@,%d", notifiactionDic["name"] as! String,age!), preferredStyle: .alert)
//
        let okAction = UIAlertAction.init(title: "ok", style: .cancel) { (UIAlertAction) in

        }
        alertControl.addAction(okAction)
        self.present(alertControl, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sourceArray.count
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: FirstCell? = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier") as? FirstCell
        if cell == nil {
            cell = FirstCell.init(style: .default, reuseIdentifier: "CellIdentifier")
        }
        let index: Int = indexPath.row
        let info = sourceArray[index]
        cell?.selectionStyle = UITableViewCell.SelectionStyle.none
        cell?.initView(info: info);
        cell?.delegate = self
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let VC = BasicVC()
        
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    func headerTap(userInfo: NSDictionary) {
        
        print(userInfo)
        
    }

}


func firstDemo(){
    
    let a = 2
//    var b = 
    
    
}
