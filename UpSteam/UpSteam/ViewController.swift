//
//  ViewController.swift
//  UpSteam
//
//  Created by Filipe Jordão on 09/12/16.
//  Copyright © 2016 FilipeJrd. All rights reserved.
//

import UIKit
import iCarousel

class ViewController: UIViewController {
    
    fileprivate static let online_color : UIColor = UIColor(red: 46/255, green: 204/255, blue: 113/255, alpha: 1.0)
    fileprivate static let offline_color : UIColor = UIColor(red: 183/255, green: 60/255, blue: 49/255, alpha: 1.0)
    
    
    @IBOutlet weak var clientLabel: UILabel!
    @IBOutlet weak var communityImage: UIImageView!
    @IBOutlet weak var userApiImage: UIImageView!
    @IBOutlet weak var storeImage: UIImageView!
    
    @IBOutlet weak var communityLabel: UILabel!
    @IBOutlet weak var userApiLabel: UILabel!
    @IBOutlet weak var storeLabel: UILabel!
    
    @IBOutlet weak var carousel: iCarousel!
    
    var dotaServicesProcessor : GameServicesStateProcessor?
    var csServicesProcessor : GameServicesStateProcessor?
    var tfServicesProcessor : GameServicesStateProcessor?
    
    
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
    
    var isSteamClientOnline: Bool = false{
        didSet{
            self.clientLabel.text = "Steam is \(isSteamClientOnline ? "Online" : "Offline")"
            if isSteamClientOnline{
                self.clientLabel.textColor = ViewController.online_color
            }else{
                self.clientLabel.textColor = ViewController.offline_color
            }

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.carousel.type = .linear
        self.carousel.delegate = self
        self.carousel.dataSource = self
        self.carousel.decelerationRate = 0.1
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        let provider = SteamGaugeServicesStateProvider(stateProcessor: self)
        provider.getServicesState()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: ServicesStateProcessor{
    
    func isOnline(client: Bool, community: Bool, store: Bool, userAPI: Bool, csGameCoordinator: Bool, csAPI: Bool, dotaGameCoordinator: Bool, dotaAPI: Bool, tfGameCoordinator: Bool, tfAPI: Bool) {
        self.isSteamClientOnline = client
        self.isCommunityOnline = community
        self.isStoreOnline = store
        self.isUserAPIOnline = userAPI
        self.dotaServicesProcessor?.isOnline(gc: dotaGameCoordinator, api: dotaAPI)
        self.csServicesProcessor?.isOnline(gc: csGameCoordinator, api: csAPI)
        self.tfServicesProcessor?.isOnline(gc: tfGameCoordinator, api: tfAPI)

    }
}



extension ViewController: iCarouselDelegate, iCarouselDataSource{
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 3
    }

    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = GameStatusView(frame: CGRect(x: 0, y: 0, width: self.carousel.frame.width*0.8, height: self.carousel.frame.height))
        view.gameName = index == 0 ? "DOTA" : "CS:GO"
        
        view.cornerRadius = view.frame.width/10
        view.backgroundColor = UIColor.blue
        
        switch index {
        case 0:
            view.gameName = "DOTA"
            self.dotaServicesProcessor = view
            
        case 1:
            view.gameName = "CS:GO"
            self.csServicesProcessor = view
            
        case 2:
            view.gameName = "TF2"
            self.tfServicesProcessor = view
        default:
            print("wut")
        }
        
        return view
    }
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        switch option {
        case .spacing:
            return 1.05
        default:
            return value
        }
    }
}

