//
//  Constants.swift
//  SpaceX
//
//  Created by Salim Maalouf on 2/4/22.
//

import UIKit

struct Constants {
    
    struct Images {
        static let placeHolderImage = UIImage(named: "placeholder")
        static let searchButtonIcon = UIImage(named: "search")
        static let notifButtonIcon = UIImage(named: "notification")
    }
    
    struct Fonts {
        struct Launches {
            static let navigationBarTitleFont = UIFont.appFont(ofSize: 25, style: .latoBold)
            static let indicatorLabelFont = UIFont.appFont(ofSize: 15, style: .latoMedium)
        }
        struct Rockets {
            static let rocketNameLabelFont = UIFont.appFont(ofSize: 20, style: .latoBold)
            static let rocketNumberLabelFont = UIFont.appFont(ofSize: 20, style: .latoBold)
            static let rocketDateLabelFont = UIFont.appFont(ofSize: 17, style: .latoMedium)
            static let rocketDescTextViewFont = UIFont.appFont(ofSize: 16, style: .latoRegular)
        }
    }
}
