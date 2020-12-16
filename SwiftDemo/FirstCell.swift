
//
//  FirstCell.swift
//  SwiftDemo
//
//  Created by 唐蒙波 on 2020/5/25.
//  Copyright © 2020 Meng. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

@objc protocol FirstCellDelegate
{
    func headerTap(userInfo : NSDictionary)
}

class FirstCell: UITableViewCell {
    
    var headerImageView = UIImageView()
    var nameLable = UILabel()
    var userInfo : NSDictionary!
    
    weak var delegate : FirstCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        headerImageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        headerImageView.backgroundColor = UIColor.red
        headerImageView.isUserInteractionEnabled = true
        contentView.addSubview(headerImageView)
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(headerTap))
        headerImageView.addGestureRecognizer(tap)
        
        nameLable = UILabel(frame: CGRect(x: headerImageView.frame.origin.x+headerImageView.frame.size.width+5, y: headerImageView.frame.origin.y, width: 100, height: headerImageView.frame.size.height))
        nameLable.font = UIFont.systemFont(ofSize: 10)
        nameLable.textColor = UIColor.black
        contentView.addSubview(nameLable)

    }
    
    
    func initView(info:NSDictionary)
    {
        userInfo = info
        headerImageView.sd_setImage(with: URL.init(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1590474608944&di=024ea48b516dad4122e2376ce9340e49&imgtype=0&src=http%3A%2F%2Ft7.baidu.com%2Fit%2Fu%3D3616242789%2C1098670747%26fm%3D79%26app%3D86%26f%3DJPEG%3Fw%3D900%26h%3D1350")) { (image, error, cacheType, url) in
        
        }
        let ageStr : NSNumber =  info["age"] as! NSNumber
        nameLable.text = String.init(format: "%@ %d", info["name"] as! CVarArg,ageStr.intValue+1)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func headerTap()
    {
        self.delegate?.headerTap(userInfo: userInfo)
    }

}
