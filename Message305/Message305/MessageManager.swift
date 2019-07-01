//
//  MessageManager.swift
//  Message305
//
//  Created by Roberto Guzman on 4/3/19.
//  Copyright © 2019 Fortytwo Sports. All rights reserved.
//

import Foundation
import UIKit

/*
 * The MessageManager can communicate to your instance through the MessageManagerDelegate
 */
@objc protocol MessageManagerDelegate {
    @objc optional func messageManagerCenteredButtonTapped()
    @objc optional func messageManagerDecisionWasMade(approved: Bool)
}


/*
 * IMPLEMENTATION
 * EX1:
 * let messageManager = MessageManager()
 * messageManager.showMessage(title: "", message: "", buttonTitle: "")
 *
 * EX2:
 * let messageManager = MessageManager()
 * let testView = TestMessageView()
 * messageManager.setUpWith(view: testView)
 * messageManager.showMessage(title: "", message: "", buttonTitle: "")
 *
 * EX3:
 * let messageManager = MessageManager()
 * messageManager.presentNoInternetAvailableAlert()
 */

/*
 * ABOUT
 * Call the MessageManager to prompt a message to the user
 * For custom views, you may add a custom view that conforms to the MessageView Protocol. Within this view, you must set the MessageViewDelegate to self.
 * the view will be presented above the statusBar Level (e.g. overlaying the statusBar)
 * Extend the MessageManager to add custom alert functions that can be called using example #3 given here.
 */

public class MessageManager {
    
    //MARK: Views
    fileprivate var messageDefaultView: MessageDefaultView? = {
        let view = MessageDefaultView(frame: UIScreen.main.bounds)
        return view
    }()
    weak var messageView: MessageView?
    
    //MARK: Public Properties
    public var feedbackIsEnabled: Bool = true      //enable or disable the haptic feedback when the message is prompted
    public var autoRemoveView: Bool = true
    
    var delegate: MessageManagerDelegate?
    
    
    public init() {
        setupWithDefaultView()
    }
    
    
    //MARK: Public Methods
    
    //display the default MessageDefaultView
    public func setupWithDefaultView() {
        guard messageDefaultView != nil else { return }
        setupWith(view: messageDefaultView)
    }
    
    //display a custom view that conforms to the MessageView protocol
    public func setupWith(view: MessageView?) {
        messageView = view
        messageView?.delegate = self
    }
    
    //loads and presents immediately the messageView with a single action button
    public func showMessage(title: String? = "", message: String? = "", buttonTitle: String) {
        DispatchQueue.main.async {
            self.messageView?.reset()
            self.messageView?.loadMessage(title: title, message: message, buttonTitle: buttonTitle)
            self.attachView()
        }
    }
    
    //loads and presents immediately the messageView with a two action buttons
    public func showMessage(title: String? = "", message: String? = "", approveTitle: String, declineTitle: String) {
        DispatchQueue.main.async {
            self.messageView?.reset()
            self.messageView?.loadMessage(title: title, message: message, approveTitle: approveTitle, declineTitle: declineTitle)
            self.attachView()
        }
    }
    
    //remove the messageView
    public func removeView() {
        messageView?.removeFromSuperview()
        if let appDelegate = UIApplication.shared.delegate as UIApplicationDelegate? {
            appDelegate.window??.windowLevel = UIWindow.Level.statusBar - 1
        }
    }
    
    
    //MARK: Private Methods
    
    fileprivate func reset() {
        messageView?.reset()
    }
    
    fileprivate func attachView() {
        guard messageView != nil else { return }
        if feedbackIsEnabled {
            providePhysicalFeedback()
        }
        if let appDelegate = UIApplication.shared.delegate as UIApplicationDelegate? {
            appDelegate.window??.addSubview(messageView!)
            appDelegate.window??.windowLevel = UIWindow.Level.statusBar + 1
        }
    }
    
    fileprivate func providePhysicalFeedback() {
        if #available(iOS 10.0, *) {
            let impact = UINotificationFeedbackGenerator()
            impact.prepare()
            impact.notificationOccurred(.warning)
        } else {
        }
    }
}


//MARK: MessageViewDelegate

extension MessageManager: MessageViewDelegate {
    public func messageCenteredButtonTapped() {
        if autoRemoveView {
            removeView()
        }
        delegate?.messageManagerCenteredButtonTapped?()
    }
    
    public func messageDecisionWasMade(approved: Bool) {
        if autoRemoveView {
            removeView()
        }
        delegate?.messageManagerDecisionWasMade?(approved: approved)
    }
}


//MARK: Custom Messages

/*
 * Extend the MessageManager to create common alerts that you can call throughout your project
 *
 * EX:
 * let messageManager = MessageManager()
 * messageManager.presentNoInternetAvailableAlert()
 */
extension MessageManager {
    
    public func presentGeneralErrorAlert() {
        showMessage(title: Constants.Strings.loadFailedTitle, message: Constants.Strings.loadFailedMessage, buttonTitle: Constants.Strings.tryAgain)
    }
    
    public func presentNoInternetAvailableAlert() {
        showMessage(title: Constants.Strings.noInternetTitle, message: Constants.Strings.checkConnectionMessage, buttonTitle: Constants.Strings.okay)
    }
    
    public func presentUpdateErrorAlert() {
        showMessage(title: Constants.Strings.updateFailedTitle, message: Constants.Strings.updateFailedMessage, buttonTitle: Constants.Strings.tryAgain)
    }
}
