//
//  Common.swift
//  SwiftDemo
//
//  Created by 唐蒙波 on 2020/5/27.
//  Copyright © 2020 Meng. All rights reserved.
//

import Foundation
import UIKit

class Common: NSObject {
    
    
    class func SringNoNull(str : Any) -> String {
        
        if((str as AnyObject).classForCoder == NSNull.classForCoder())
        {
            return ""
        }
        else if((str as AnyObject).classForCoder == NSNumber.classForCoder())
        {
            let numberStr : NSNumber = str as! NSNumber
            return String.init(format: "%d", numberStr.intValue)
        }
        else
        {
            return str as! String
        }
    }
    
    class func colorWithRGB(rgbValue : Int) -> UIColor {
        
        return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0, green: ((CGFloat)((rgbValue & 0xFF00) >> 8))/255.0, blue: ((CGFloat)(rgbValue & 0xFF))/255.0, alpha: 1.0)
    }

    
}
