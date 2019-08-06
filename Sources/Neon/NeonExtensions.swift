
//#if os(iOS)
import UIKit
//#else
//import Cocoa
//#endif

// MARK: UIView implementation of the Neon protocols.
//
extension UIView : Frameable, Anchorable, Alignable, Groupable {
    public var superFrame: CGRect {
        guard let superview = superview else {
            return CGRect.zero
        }
        
        return superview.frame
    }
    
    public var isRightToLeft: Bool {
        //#if os(iOS)
        if #available(iOS 10.0, *) {
            return effectiveUserInterfaceLayoutDirection == .rightToLeft
            
        } else if #available(iOS 9.0, *) {
            return UIView.userInterfaceLayoutDirection(for: semanticContentAttribute) == .rightToLeft
        } else {
            // Fallback on earlier versions
            return true
        }
        //        #else
        //        return self.userInterfaceLayoutDirection == .rightToLeft
        //        #endif
    }
    
    public func setDimensionAutomatically() {
        //#if os(iOS)
        self.sizeToFit()
        //        #else
        //        self.autoresizesSubviews = true
        //        self.autoresizingMask = [.width, .height]
        //        #endif
    }
}


// MARK: CALayer implementation of the Neon protocols.

extension CALayer: Frameable, Anchorable, Alignable, Groupable {

    public var superFrame: CGRect {
        guard let superlayer = superlayer else {
            return CGRect.zero
        }
        
        return superlayer.frame
    }
    
    public var isRightToLeft: Bool {
        //#if os(iOS)
        return UIView().isRightToLeft
        //        #else
        //        return NSView().userInterfaceLayoutDirection == .rightToLeft
        //        #endif
    }
    
    public func setDimensionAutomatically() { /* no-op here as this shouldn't apply to CALayers */ }
}
