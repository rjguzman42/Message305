# Message305
A simple way to alert the user through a default or customizable view, and a simple display integration.


# Implementation

Add the project to your podfile
```
target 'TestApp' do
# Comment the next line if you don't want to use dynamic frameworks
use_frameworks!

pod 'Message305', :git => 'https://github.com/rjguzman42/Message305.git'

end
```

Import the Message305 framework
```
import Message305
```

## Custom View Example
MessageDefaultView is the default view used by the MessageManager. But you can create a custom UIView that can be used to display a message to the user.

Create a UIView, and extend the view to the MessageView protocol.
```
extension MessageDefaultView: MessageView {
    
}
```

Create a MessageViewDelegate property inside your MessageView to communicate with the MessageManager. The MessageManager conforms to the MessageViewDelegate in order to listen to your MessageView.
```
var delegate: MessageViewDelegate?
```

Conform to the protocol's required functions. The MesageManager will tell your view to do several actions such as loadMessage and reset. You will need to inform the delegate when the user has selected an action by calling the delegate?.messageCenteredButtonTapped() and delegate?.messageDecisionWasMade() functions.
```
extension MessageDefaultView: MessageViewDelegate {
    func messageCenteredButtonTapped() {
        delegate?.messageCenteredButtonTapped?()
    }
    
    func messageDecisionWasMade(approved: Bool) {
        delegate?.messageDecisionWasMade?(approved: approved)
    }
}
```
