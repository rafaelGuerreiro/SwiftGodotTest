import SwiftGodot

#if canImport(UIKit)
import UIKit
#else
import AppKit
#endif

@Godot
class SpinParent: Node {
    
    var parent: Node2D?
    
    public override func _ready() {
        self.parent = self.getParent() as? Node2D
        showAlert()
    }
    
    public override func _process(delta: Double) {
        if let parent {
            parent.rotate(radians: delta)
        }
    }

    /// The intention with this method is to create OS specific dependencies that are required to build.
    func showAlert() {
#if canImport(UIKit)
        let alert = UIAlertView()
        alert.title = "Alert from swift"
        alert.message = "Here's a message for iOS"
        alert.addButton(withTitle: "Ok")
        alert.show()
#else
        let alert = NSAlert.init()
        alert.messageText = "Alert from swift"
        alert.informativeText = "Here's a message for MacOSX"
        alert.addButton(withTitle: "OK")
        alert.runModal()
#endif
    }
}

