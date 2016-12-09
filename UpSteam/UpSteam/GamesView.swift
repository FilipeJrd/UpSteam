//
//  GamesView.swift
//  UpSteam
//
//  Created by Filipe Jordão on 09/12/16.
//  Copyright © 2016 FilipeJrd. All rights reserved.
//

import UIKit

@IBDesignable
class GamesView: UIView {
    @IBInspectable var cornerRadius : Float = 0.0 {
        didSet{
            self.layer.masksToBounds = true
            self.layer.cornerRadius = (self.frame.width/100) * CGFloat(cornerRadius)
        }
    }
}
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */


