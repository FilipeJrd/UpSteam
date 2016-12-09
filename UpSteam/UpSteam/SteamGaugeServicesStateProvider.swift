//
//  SteamGaugeServicesStateProvider.swift
//  UpSteam
//
//  Created by Filipe Jordão on 09/12/16.
//  Copyright © 2016 FilipeJrd. All rights reserved.
//

import UIKit
import Alamofire

class SteamGaugeServicesStateProvider: NSObject {
    var stateProcessor : ServicesStateProcessor
    
    init(stateProcessor : ServicesStateProcessor){
        self.stateProcessor = stateProcessor
        super.init()
        let timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.getServicesState), userInfo: nil, repeats: true)
        timer.fire()

    }
    
    func getServicesState(){
        Alamofire.request("http://steamgaug.es/api/v2").responseJSON(completionHandler: {
            response in
            
            if let JSON : [String:Any] = try? JSONSerialization.jsonObject(with: response.data!, options:[]) as! [String: Any]{
                
                let store = ((JSON["SteamStore"] as! [String:Any])["online"] as! Int) == 1
                let community = ((JSON["SteamCommunity"] as! [String:Any])["online"] as! Int) == 1
                let user = ((JSON["ISteamUser"] as! [String:Any])["online"] as! Int) == 1
                
                let gameApi = JSON["IEconItems"] as! [String:Any]
                
                let dotaApi = ((gameApi["570"] as! [String:Any])["online"] as! Int) == 1
                let csApi = ((gameApi["730"] as! [String:Any])["online"] as! Int) == 1
                
                let gameCoordinator = JSON["ISteamGameCoordinator"] as! [String:Any]
                
                let dotaGC = ((gameCoordinator["570"] as! [String:Any])["online"] as! Int) == 1
                
                let csGC = ((gameCoordinator["730"] as! [String:Any])["online"] as! Int) == 1
                
                
                
                self.stateProcessor.isOnline(community: community, store: store, userAPI: user, csGameCoordinator: csGC, csAPI: csApi, dotaGameCoordinator: dotaGC, dotaAPI: dotaApi)

            }
        })
    }
    
}

