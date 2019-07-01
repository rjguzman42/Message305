#
#  Be sure to run `pod spec lint Message305.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

    spec.name         = "Message305"
    spec.version      = "0.0.2"
    spec.summary      = "A simple way to alert the user through a default or customizable view, and a simple display integration"
    spec.description  = "Message305 provides a simple interface to alert a user. Call an instance of the MessageManager and simply call .show() or .hide()"
    spec.license      = "MIT"
    spec.homepage     = "https://github.com/rjguzman42/Message305"
    spec.author       = { "Roberto Guzman" => "rjguzman42@gmail.com" }
    spec.platform     = :ios, "12.0"
    spec.swift_version = '5.0'
    spec.source       = { :git => "https://github.com/rjguzman42/Message305.git", :tag => "0.0.2" }
    spec.source_files  = "Message305/**/*.swift"

end
