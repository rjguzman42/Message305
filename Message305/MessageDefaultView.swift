//
//  MessageDefaultView.swift
//  Message305
//
//  Created by Roberto Guzman on 4/2/19.
//  Copyright © 2019 Fortytwo Sports. All rights reserved.
//

import Foundation
import UIKit

class MessageDefaultView: UIView {
    
    
    //MARK: Views
    lazy var messageDefaultCardView: MessageDefaultCardView = {
        let size = messageViewSize
        let view = MessageDefaultCardView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        view.delegate = self
        return view
    }()
    var messageViewSize: CGSize {
        var width: CGFloat = frame.size.width - (Constants.Sizes.messageViewHorizontalSpacing * 2)
        if UIDevice.current.userInterfaceIdiom == .pad {
            width = frame.size.width / 2
        } else {
            width = frame.size.width - (Constants.Sizes.messageViewHorizontalSpacing * 2)
        }
        if UIDevice.current.orientation.isLandscape {
            width = width * 0.5
        }
        let height: CGFloat = 100
        return CGSize(width: width, height: height)
    }
    
    //MARK: Callbacks
    weak var delegate: MessageViewDelegate?
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    //MARK: UI
    
    private func setupSubViews() {
        DispatchQueue.main.async {
            self.backgroundColor = Theme.Colors.backgroundBlack.color.withAlphaComponent(0.5)
            self.attachSubViews()
            self.setupConstraints()
        }
    }
    
    private func attachSubViews() {
        addSubview(messageDefaultCardView)
    }
    
    private func setupConstraints() {
        //messageDefaultCardView
        let size: CGSize = messageViewSize
        addConstraintsWithFormat(format: "H:[v0(\(size.width))]", views: messageDefaultCardView)
        addConstraintsWithFormat(format: "V:[v0]", views: messageDefaultCardView)
        messageDefaultCardView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        messageDefaultCardView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}

extension MessageDefaultView: MessageView {
    func reset() {
        messageDefaultCardView.reset()
    }
    
    func loadMessage(title: String? = "", message: String? = "", buttonTitle: String) {
        messageDefaultCardView.loadMessage(title: title, message: message, buttonTitle: buttonTitle)
    }
    
    func loadMessage(title: String? = "", message: String? = "", approveTitle: String, declineTitle: String) {
        messageDefaultCardView.loadMessage(title: title, message: message, approveTitle: approveTitle, declineTitle: declineTitle)
    }
}

extension MessageDefaultView: MessageViewDelegate {
    func messageCenteredButtonTapped() {
        delegate?.messageCenteredButtonTapped?()
    }
    
    func messageDecisionWasMade(approved: Bool) {
        delegate?.messageDecisionWasMade?(approved: approved)
    }
}
