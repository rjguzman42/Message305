//
//  MessageView.swift
//  Message305
//
//  Created by Roberto Guzman on 4/4/19.
//  Copyright © 2019 Fortytwo Sports. All rights reserved.
//

import Foundation
import UIKit

/*
 * ABOUT
 * Create a MessageView that will handle the UI for prompting a user.
 * You can manage the MessageView through the MessageManager. To do so, pass the MessageView inside the manager's setupWith(view: MessageView) function.
 */
public protocol MessageView: UIView {
    var delegate: MessageViewDelegate?  { get set }
    
    func reset()
    func loadMessage(title: String?, message: String?, buttonTitle: String)
    func loadMessage(title: String?, message: String?, approveTitle: String, declineTitle: String)
}

/*
 * A custom MessageView can communicate to the MessageManager through the MessageViewDelegate
 */
@objc public protocol MessageViewDelegate {
    @objc optional func messageCenteredButtonTapped()
    @objc optional func messageDecisionWasMade(approved: Bool)
}
