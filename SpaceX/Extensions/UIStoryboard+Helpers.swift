//
//  UIStoryboard+Helpers.swift
//  SpaceX
//
//  Created by Salim Maalouf on 2/2/22.
//

import UIKit

enum Storyboard: String {
    case Launches
    case Inner
}

extension UIStoryboard {
    private static func storyboard(for storyboard: Storyboard) -> UIStoryboard {
        UIStoryboard(name: storyboard.rawValue, bundle: nil)
    }
    
    static func viewControllerFromStoryboard<T: UIViewController>(_ storyboard: Storyboard) -> T {
        return UIStoryboard.storyboard(for: storyboard).instantiateViewController(withIdentifier: T.storyboardIdentifier) as! T
    }
}

extension UIViewController {
    static var storyboardIdentifier: String {
        String(describing: Self.self)
    }
}
