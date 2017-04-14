//
//  UIViewExtensions.swift
//  UpSteam
//
//  Created by Filipe Jordão on 10/03/17.
//  Copyright © 2017 FilipeJrd. All rights reserved.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
