//
//  MessageButton.swift
//  Message305
//
//  Created by Roberto Guzman on 3/27/19.
//  Copyright © 2019 Fortytwo Sports. All rights reserved.
//

import Foundation
import UIKit

class MessageButton: UIButton {
    
    //MARK: Private Properties
    fileprivate let loadingControl: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        view.color = UIColor.white
        view.hidesWhenStopped = true
        view.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    fileprivate var cachedTitle: String?            //set when setTitle() called, except when loading to prevent overriding the cachedTitle when displaying loadingControl
    
    //MARK: Public Properties
    var isLoading: Bool  = false {
        didSet {
            configureLoading()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCorners()
    }
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(title, for: state)
        if !isLoading {
            cachedTitle = title
        }
    }
    
    static func getButtonSize(superFrame: CGRect, sizeType: MessageButtonSizeType = .normal) -> CGSize {
        var width: CGFloat = 0
        switch sizeType {
        case .normal:
            if UIDevice.current.userInterfaceIdiom == .pad {
                width = superFrame.size.width / 2
            } else {
                width = superFrame.size.width - (Constants.Sizes.highlightedButtonHorizontalSpacing * 2)
            }
        case .small:
            if UIDevice.current.userInterfaceIdiom == .pad {
                width = superFrame.size.width / 3
            } else {
                width = superFrame.size.width - (Constants.Sizes.highlightedButtonHorizontalSpacingLarge * 2)
            }
        case .doubleSmall:
            if UIDevice.current.userInterfaceIdiom == .pad {
                width = (superFrame.size.width / 2) / 2
            } else {
                width = (superFrame.size.width / 2) - (Constants.Sizes.highlightedButtonHorizontalSpacing * 2)
            }
        }
        if UIDevice.current.orientation.isLandscape {
            width = width * 0.5
        }
        let calculatedHeight: CGFloat = width *  Constants.Sizes.highlightedButtonHeightMultiplier
        let height: CGFloat = max(calculatedHeight, 50)
        return CGSize(width: width, height: height)
    }
    
    func setHighlightedTheme() {
        backgroundColor = Theme.Colors.topaz.color
        setTitleColor(Theme.Colors.backgroundWhite.color, for: .normal)
    }
    
    func setNormalTheme() {
        backgroundColor = Theme.Colors.backgroundWhite.color
        setTitleColor(Theme.Colors.gunmetal.color, for: .normal)
    }
    
    private func setupUI() {
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        setNormalTheme()
        isUserInteractionEnabled = true
        
        //loadingControl
        addSubview(loadingControl)
        loadingControl.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loadingControl.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    private func setupCorners() {
        roundCornersWithLayer(radius: frame.size.height / 2)
    }
    
    private func configureLoading() {
        if isLoading {
            loadingControl.startAnimating()
            setTitle("", for: .normal)
        } else {
            loadingControl.stopAnimating()
            setTitle(cachedTitle, for: .normal)
        }
    }
    
}

enum MessageButtonSizeType {
    case doubleSmall
    case small
    case normal
}
