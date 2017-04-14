//
//  DotaStatusView.swift
//  UpSteam
//
//  Created by Filipe Jordão on 10/03/17.
//  Copyright © 2017 FilipeJrd. All rights reserved.
//

import UIKit

@IBDesignable
class GameStatusView: UIView {
    
    fileprivate static let online_color : UIColor = UIColor(red: 46/255, green: 204/255, blue: 113/255, alpha: 1.0)
    fileprivate static let offline_color : UIColor = UIColor(red: 183/255, green: 60/255, blue: 49/255, alpha: 1.0)
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var contentView : UIView?
    
    var gameName : String = ""{
        didSet{
            self.GameLabel.text = self.gameName
        }
    }
    
    @IBOutlet weak var GameLabel: UILabel!
    
    @IBOutlet weak var GameCoordinatorLabel: UILabel!
    @IBOutlet weak var GameCoordinatorIcon: UIImageView!
    
    
    @IBOutlet weak var APILabel: UILabel!
    @IBOutlet weak var APIIcon: UIImageView!
    
    var isGCOnline : Bool = false {
        didSet{
            if isGCOnline{
                self.GameCoordinatorIcon.image = #imageLiteral(resourceName: "Online")
                self.GameCoordinatorLabel.textColor = GameStatusView.online_color
            }else{
                self.GameCoordinatorIcon.image = #imageLiteral(resourceName: "Offline")
                self.GameCoordinatorLabel.textColor = GameStatusView.offline_color
                
            }
        }
    }
    
    var isAPIOnline : Bool = false {
        didSet{
            if isAPIOnline{
                self.APIIcon.image = #imageLiteral(resourceName: "Online")
                self.APILabel.textColor = GameStatusView.online_color
            }else{
                self.APIIcon.image = #imageLiteral(resourceName: "Offline")
                self.APILabel.textColor = GameStatusView.offline_color
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        contentView = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        contentView!.frame = bounds
        
        // Make the view stretch with containing view
        contentView!.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(contentView!)
    }
    
    func loadViewFromNib() -> UIView! {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }

}

extension GameStatusView : GameServicesStateProcessor{
    func isOnline(gc: Bool, api: Bool) {
        self.isAPIOnline = api
        self.isGCOnline = gc
    }
}
