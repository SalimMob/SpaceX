//
//  UIView+Rounded.swift
//  SpaceX
//
//  Created by Salim Maalouf on 2/3/22.
//

import UIKit

extension UIView {
    
    func roundedTopLeft() {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: [.topLeft],
                                     cornerRadii: CGSize(width: 7, height: 7))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }
    
    func roundedTopRight() {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: [.topRight],
                                     cornerRadii: CGSize(width: 7, height: 7))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }
    
    func roundedBottomLeft() {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: [.bottomLeft],
                                     cornerRadii: CGSize(width: 7, height: 7))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }
    
    func roundedBottomRight() {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: [.bottomRight],
                                     cornerRadii: CGSize(width: 7, height: 7))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }
    
    func roundedBottom() {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: [.bottomRight , .bottomLeft],
                                     cornerRadii: CGSize(width: 7, height: 7))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }
    
    func roundedTop() {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: [.topRight , .topLeft],
                                     cornerRadii: CGSize(width: 7, height: 7))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }
    
    func roundedLeft() {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: [.topLeft , .bottomLeft],
                                     cornerRadii: CGSize(width: 7, height: 7))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }
    
    func roundedRight() {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: [.topRight , .bottomRight],
                                     cornerRadii: CGSize(width: 7, height: 7))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }
    
    func roundedAllCorner(cornderRadius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: [.topRight , .bottomRight , .topLeft , .bottomLeft],
                                     cornerRadii: CGSize(width: cornderRadius, height: cornderRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }
}
