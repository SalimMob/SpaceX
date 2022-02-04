//
//  UIViewController+NavTitle.swift
//  SpaceX
//
//  Created by Salim Maalouf on 2/3/22.
//

import UIKit

extension UIViewController {
    
    func setLeftAlignTitleView(font: UIFont, text: String, textColor: UIColor, leftSpacing: CGFloat) {
        guard let navFrame = navigationController?.navigationBar.frame else { return }
        let parentView = UIView(frame: CGRect(x: leftSpacing - 8, y: 0, width: navFrame.width, height: navFrame.height))
        navigationItem.titleView = parentView
        let label = UILabel(frame: .init(x: parentView.frame.minX, y: parentView.frame.minY, width: parentView.frame.width, height: parentView.frame.height))
        label.backgroundColor = .clear
        label.numberOfLines = 1
        label.font = font
        label.textAlignment = .left
        label.textColor = textColor
        label.text = text
        parentView.addSubview(label)
    }
}
