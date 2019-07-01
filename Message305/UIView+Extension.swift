//
//  UIView+Message305.swift
//  Message305
//
//  Created by Roberto Guzman on 7/1/19.
//  Copyright © 2019 Fortytwo Sports. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    //MARK: Layout Constraints
    
    //Adds constraints to a specific UIView relative to other UIViews.
    //Function handles the safeareaspaces introduced in iOS 11.
    func addConstraintsWithFormat(isVC: Bool = false, format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        @available(iOS 11.0, *)
        func filterFormat(_ format: inout String) {
            guard let window = UIApplication.shared.keyWindow else {
                return
            }
            
            let newInsets = isVC ? window.safeAreaInsets as UIEdgeInsets : self.safeAreaInsets as UIEdgeInsets
            let leftMargin = newInsets.left > 0 ? newInsets.left : 0
            let rightMargin = newInsets.right > 0 ? newInsets.right : 0
            let topMargin = newInsets.top > 0 ? newInsets.top : 0
            let bottomMargin = newInsets.bottom > 0 ? newInsets.bottom : 0
            
            //left & top margins
            guard let colonIndex = format.firstIndex(of: ":") else {
                return
            }
            let charAfterColonIndex = format.index(after: colonIndex)
            if format[charAfterColonIndex] == "|" {
                guard let firstBracketIndex = format.firstIndex(of: "[") else {
                    return
                }
                let stuckToWall: Bool = format[format.index(after: charAfterColonIndex)] == "[" ? true : false
                
                if stuckToWall {
                    let extraMargin: Int = String(format.first ?? Character("")) == "H" ? Int(leftMargin) : Int(topMargin)
                    format.insert(contentsOf: "-\(extraMargin)-", at: format.index(after: charAfterColonIndex))
                } else {
                    let rangeIndexOfMeasurements: ClosedRange<String.Index> = format.index(after: charAfterColonIndex)...format.index(before: firstBracketIndex)
                    var measurements: String = stuckToWall ? "" : String(format[rangeIndexOfMeasurements])
                    measurements = measurements.replacingOccurrences(of: "-", with: "")
                    if let number = NumberFormatter().number(from: measurements) {
                        let extraMargin: Int = String(format.first ?? Character("")) == "H" ? Int(truncating: number) + Int(leftMargin) : (Int(truncating: number)) + Int(topMargin)
                        format.replaceSubrange(rangeIndexOfMeasurements, with: "-\(extraMargin)-")
                    }
                }
            }
            
            //right & bottom margins
            let lastIndex = format.index(before: format.endIndex)
            if format[lastIndex] == "|" {
                guard let lastBracketIndex = format.lastIndex(of: "]"), let lastIndex = format.lastIndex(of: "|") else {
                    return
                }
                let stuckToWall: Bool = lastBracketIndex.utf16Offset(in: format) == (lastIndex.utf16Offset(in: format) - 1) ? true : false
                
                if stuckToWall {
                    let extraMargin: Int = String(format.first ?? Character("")) == "H" ? Int(rightMargin) : Int(bottomMargin)
                    format.insert(contentsOf: "-\(extraMargin)-", at: format.index(after: lastBracketIndex))
                } else {
                    let rangeIndexOfMeasurements: ClosedRange<String.Index> = format.index(after: lastBracketIndex)...format.index(before: lastIndex)
                    var measurements: String = String(format[rangeIndexOfMeasurements])
                    measurements = measurements.replacingOccurrences(of: "-", with: "")
                    if let number = NumberFormatter().number(from: measurements) {
                        let extraMargin: Int = String(format.first ?? Character("")) == "H" ? Int(truncating: number) + Int(rightMargin) : Int(truncating: number) + Int(bottomMargin)
                        format.replaceSubrange(rangeIndexOfMeasurements, with: "-\(extraMargin)-")
                    }
                }
            }
        }
        
        var format: String = format
        if #available(iOS 11.0, *) {
            filterFormat(&format)
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    func removeAllConstraints() {
        for constraint in constraints {
            removeConstraint(constraint)
        }
    }
    
    
    //MARK: Corners & Shadows
    
    func roundCornersWithLayer(radius: CGFloat) {
        layer.roundCorners(radius: radius)
    }
    
    func addShadowWithLayer(color: UIColor = .black, opacity: Float = 0.2, offSet: CGSize = .zero, radius: CGFloat = 10) {
        layer.addShadow(color: color, opacity: opacity, offSet: offSet, radius: radius)
    }
}
