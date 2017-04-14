//
//  GameServicesStateProcessor.swift
//  UpSteam
//
//  Created by Filipe Jordão on 13/04/17.
//  Copyright © 2017 FilipeJrd. All rights reserved.
//

import Foundation
protocol GameServicesStateProcessor {
    func isOnline(gc: Bool, api: Bool)
}
