//
//  ServicesStateProvider.swift
//  UpSteam
//
//  Created by Filipe Jordão on 09/12/16.
//  Copyright © 2016 FilipeJrd. All rights reserved.
//

import Foundation
protocol ServicesStateProcessor {
    func isOnline(client: Bool, community: Bool, store: Bool, userAPI: Bool, csGameCoordinator: Bool, csAPI: Bool, dotaGameCoordinator: Bool, dotaAPI: Bool, tfGameCoordinator: Bool, tfAPI: Bool)
}
