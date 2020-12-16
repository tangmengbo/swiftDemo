//
//  Define.swift
//  SwiftDemo
//
//  Created by 唐蒙波 on 2020/5/27.
//  Copyright © 2020 Meng. All rights reserved.
//
import UIKit
import Foundation


let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

let IS_IPHONE_X = UIScreen.main.bounds.size.height >= 812.0 ? true : false


let TOP_STATUSBAR_HEIGHT = CGFloat(IS_IPHONE_X==true ? 35.0 : 20.0)
let BOTTOM_TABBAR_HEIGHT = CGFloat(IS_IPHONE_X==true ? 64.0 : 49.0)

let BiLiWidth = UIScreen.main.bounds.size.width/375
let BiLiHeight = UIScreen.main.bounds.size.height/667


//
//let STATUS_AND_NAV_BAR_HEIGHT:CGFloat = IS_IPHONE_X == true ? 88.0 : 64.0
//let NAVBAR_HEIGHT:CGFloat = 44
//let TABBAR_HEIGHT:CGFloat = IS_IPHONE_X == true ? 83.0 : 49.0
//let BOTTOM_SAFE_HEIGHT:CGFloat = IS_IPHONE_X == true ? 34 : 0


