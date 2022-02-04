//
//  UIFont.swift
//  SpaceX
//
//  Created by Salim Maalouf on 2/4/22.
//

import UIKit

extension UIFont {
    enum FontStyle: String {
        case latoBold = "Lato-Bold"
        case latoMedium = "Lato-Medium"
        case latoRegular = "Lato-Regular"
        case latoSemibold = "Lato-Semibold"
    }
    
    static func appFont(ofSize size: CGFloat, style: UIFont.FontStyle) -> UIFont {
        UIFont(name: style.rawValue, size: size)!
    }
}
