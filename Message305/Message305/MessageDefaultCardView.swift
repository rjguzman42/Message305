//
//  MessageDefaultCardView.swift
//  Message305
//
//  Created by Roberto Guzman on 4/2/19.
//  Copyright © 2019 Fortytwo Sports. All rights reserved.
//

import Foundation
import UIKit

class MessageDefaultCardView: UIView {
    
    //MARK: Subviews
    lazy var headerBackground: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: Constants.Sizes.messageViewHeaderHeight))
        view.backgroundColor = Theme.Colors.titleGray.color
        view.clipsToBounds = true
        return view
    }()
    lazy var headerTitle: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: Constants.Sizes.messageViewHeaderHeight))
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = Theme.Colors.gunmetal.color
        label.textAlignment = .center
        return label
    }()
    lazy var bodyLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: 100))
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = Theme.Colors.gunmetal.color
        label.textAlignment = .center
        return label
    }()
    lazy var centeredButton: MessageButton = {
        let size = centeredButtonSize
        let button = MessageButton(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        button.setHighlightedTheme()
        return button
    }()
    lazy var approveButton: MessageButton = {
        let size = centeredButtonSize
        let button = MessageButton(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        button.setHighlightedTheme()
        return button
    }()
    lazy var declineButton: MessageButton = {
        let size = centeredButtonSize
        let button = MessageButton(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        button.setHighlightedTheme()
        return button
    }()
    
    
    //MARK: Layout Constraints
    fileprivate var centeredButtonSize: CGSize {
        return MessageButton.getButtonSize(superFrame: self.frame, sizeType: .small)
    }
    fileprivate var twoButtonSize: CGSize {
        return MessageButton.getButtonSize(superFrame: self.frame, sizeType: .doubleSmall)
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

    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCorners()
        setupShadows()
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        removeAllConstraints()
        setupConstraints()
    }
    
    
    //MARK: UI
    
    private func setupSubViews() {
        backgroundColor = Theme.Colors.backgroundWhite.color
        attachSubViews()
        setupConstraints()
        addGestures()
    }
    
    private func attachSubViews() {
        addSubview(headerBackground)
        headerBackground.addSubview(headerTitle)
        addSubview(bodyLabel)
        addSubview(centeredButton)
        addSubview(approveButton)
        addSubview(declineButton)
    }
    
    private func setupConstraints() {
        
        //headerBackground
        addConstraintsWithFormat(format: "H:|[v0]|", views: headerBackground)
        addConstraintsWithFormat(format: "V:|[v0(\(headerBackground.frame.size.height))]", views: headerBackground)
        
        //headerTitle
        addConstraintsWithFormat(format: "H:|-2-[v0]-2-|", views: headerTitle)
        addConstraintsWithFormat(format: "V:|[v0]|", views: headerTitle)
        
        //bodyLabel
        addConstraintsWithFormat(format: "H:|-9-[v0]-9-|", views: bodyLabel)
        addConstraintsWithFormat(format: "V:[v1]-\(Constants.Sizes.messageBodyLabelToHeaderSpacing)-[v0]", views: bodyLabel, headerBackground)
        
        //centeredButton
        let buttonSize: CGSize = centeredButtonSize
        addConstraintsWithFormat(format: "H:[v0(\(buttonSize.width))]", views: centeredButton)
        addConstraintsWithFormat(format: "V:[v1]-\(Constants.Sizes.messageButtonToBodySpacing)-[v0(\(buttonSize.height))]-\(Constants.Sizes.messageButtonBottomSpacing)-|", views: centeredButton, bodyLabel)
        centeredButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        //approveButton
        let approveButtonSize: CGSize = twoButtonSize
        addConstraintsWithFormat(format: "H:[v0(\(approveButtonSize.width))]", views: approveButton)
        addConstraintsWithFormat(format: "V:[v1]-\(Constants.Sizes.messageButtonToBodySpacing)-[v0(\(approveButtonSize.height))]-\(Constants.Sizes.messageButtonBottomSpacing)-|", views: approveButton, bodyLabel)
        approveButton.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 5).isActive = true
        
        //declineButton
        let declineButtonSize: CGSize = twoButtonSize
        addConstraintsWithFormat(format: "H:[v0(\(declineButtonSize.width))]", views: declineButton)
        addConstraintsWithFormat(format: "V:[v1]-\(Constants.Sizes.messageButtonToBodySpacing)-[v0(\(declineButtonSize.height))]-\(Constants.Sizes.messageButtonBottomSpacing)-|", views: declineButton, bodyLabel)
        declineButton.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -5).isActive = true
    }
    
    private func setupCorners() {
        clipsToBounds = true
        roundCornersWithLayer(radius: frame.size.width / 40)
    }
    
    private func setupShadows() {
        
    }
    
    //MARK: Actions
    
    private func addGestures() {
        centeredButton.addTarget(self, action: #selector(handleCenterButtonTapped), for: .touchUpInside)
        approveButton.addTarget(self, action: #selector(handleApproveButtonTapped), for: .touchUpInside)
        declineButton.addTarget(self, action: #selector(handleDeclineButtonTapped), for: .touchUpInside)
    }
    
    @objc private func handleCenterButtonTapped() {
        delegate?.messageCenteredButtonTapped?()
    }
    
    @objc private func handleApproveButtonTapped() {
        delegate?.messageDecisionWasMade?(approved: true)
    }
    
    @objc private func handleDeclineButtonTapped() {
        delegate?.messageDecisionWasMade?(approved: false)
    }
    
    fileprivate func setState(_ state: MessageState) {
        switch state {
        case .okay:
            approveButton.isHidden = true
            declineButton.isHidden = true
            centeredButton.isHidden = false
        case .option:
            approveButton.isHidden = false
            declineButton.isHidden = false
            centeredButton.isHidden = true
        }
    }
}


//MARK: MessageView

extension MessageDefaultCardView: MessageView {
    func reset() {
        headerTitle.text = ""
        bodyLabel.text = ""
        centeredButton.setTitle("", for: .normal)
        approveButton.setTitle("", for: .normal)
        declineButton.setTitle("", for: .normal)
    }
    
    func loadMessage(title: String? = "", message: String? = "", buttonTitle: String) {
        headerTitle.text = title
        bodyLabel.text = message
        centeredButton.setTitle(buttonTitle, for: .normal)
        setState(.okay)
    }
    
    func loadMessage(title: String? = "", message: String? = "", approveTitle: String, declineTitle: String) {
        headerTitle.text = title
        bodyLabel.text = message
        approveButton.setTitle(approveTitle, for: .normal)
        declineButton.setTitle(declineTitle, for: .normal)
        setState(.option)
    }
}


//MARK: MessageState

fileprivate enum MessageState {
    case okay
    case option
}
