//
//  ViewController.swift
//  UpSteam
//
//  Created by Filipe Jordão on 09/12/16.
//  Copyright © 2016 FilipeJrd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private static let online_color : UIColor = UIColor(red: 46/255, green: 204/255, blue: 113/255, alpha: 1.0)
    private static let offline_color : UIColor = UIColor(red: 183/255, green: 60/255, blue: 49/255, alpha: 1.0)
    @IBOutlet weak var gamesView: UIView!
    
    @IBOutlet weak var communityImage: UIImageView!
    @IBOutlet weak var userApiImage: UIImageView!
    @IBOutlet weak var storeImage: UIImageView!
    
    @IBOutlet weak var communityLabel: UILabel!
    @IBOutlet weak var userApiLabel: UILabel!
    @IBOutlet weak var storeLabel: UILabel!
    
    @IBOutlet weak var csGameCoordinatorImage: UIImageView!
    @IBOutlet weak var csAPIImage: UIImageView!

    @IBOutlet weak var csGameCoordinatorLabel: UILabel!
    @IBOutlet weak var csAPILabel: UILabel!
    
    
    @IBOutlet weak var dotaGameCoordinatorImage: UIImageView!
    @IBOutlet weak var dotaAPIImage: UIImageView!
    
    @IBOutlet weak var dotaGameCoordinatorLabel: UILabel!
    @IBOutlet weak var dotaAPILabel: UILabel!
    
    var isCommunityOnline : Bool = false{
        didSet{
            if isCommunityOnline{
                self.communityImage.image = #imageLiteral(resourceName: "Online")
                self.communityLabel.textColor = ViewController.online_color
            }else{
                self.communityImage.image = #imageLiteral(resourceName: "Offline")
                self.communityLabel.textColor = ViewController.offline_color
            }
        }
    }
    
    
    var isStoreOnline : Bool = false{
        didSet{
            if isStoreOnline{
                self.storeImage.image = #imageLiteral(resourceName: "Online")
                self.storeLabel.textColor = ViewController.online_color
            }else{
                self.storeImage.image = #imageLiteral(resourceName: "Offline")
                self.storeLabel.textColor = ViewController.offline_color
            }
        }
    }
    
    
    var isUserAPIOnline : Bool = false{
        didSet{
            if isUserAPIOnline{
                self.userApiImage.image = #imageLiteral(resourceName: "Online")
                self.userApiLabel.textColor = ViewController.online_color
            }else{
                self.userApiImage.image = #imageLiteral(resourceName: "Offline")
                self.userApiLabel.textColor = ViewController.offline_color
            }
        }
    }
    
    var isCSGCOnline : Bool = false{
        didSet{
            if isCSGCOnline{
                self.csGameCoordinatorImage.image = #imageLiteral(resourceName: "Online")
                self.csGameCoordinatorLabel.textColor = ViewController.online_color
            }else{
                self.csGameCoordinatorImage.image = #imageLiteral(resourceName: "Offline")
                self.csGameCoordinatorLabel.textColor = ViewController.offline_color
            }
        }
    }
    
    
    var isDotaGCOnline : Bool = false{
        didSet{
            if isDotaGCOnline{
                self.dotaGameCoordinatorImage.image = #imageLiteral(resourceName: "Online")
                self.dotaGameCoordinatorLabel.textColor = ViewController.online_color
            }else{
                self.dotaGameCoordinatorImage.image = #imageLiteral(resourceName: "Offline")
                self.dotaGameCoordinatorLabel.textColor = ViewController.offline_color
            }
        }
    }
    
    
    var isCSAPIOnline : Bool = false{
        didSet{
            if isCSAPIOnline{
                self.csAPIImage.image = #imageLiteral(resourceName: "Online")
                self.csAPILabel.textColor = ViewController.online_color
            }else{
                self.csAPIImage.image = #imageLiteral(resourceName: "Offline")
                self.csAPILabel.textColor = ViewController.offline_color
            }
        }
    }
    
    
    var isDotaAPIOnline : Bool = false{
        didSet{
            if isDotaAPIOnline{
                self.dotaAPIImage.image = #imageLiteral(resourceName: "Online")
                self.dotaAPILabel.textColor = ViewController.online_color
            }else{
                self.dotaAPIImage.image = #imageLiteral(resourceName: "Offline")
                self.dotaAPILabel.textColor = ViewController.offline_color
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        self.isDotaAPIOnline = true
        self.isUserAPIOnline = true
        self.isCSGCOnline = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

