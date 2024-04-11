import UIKit
import SwiftUI

public extension UIViewController {
    func add(swiftUIView: AnyView) {
        let childView = UIHostingController(rootView: AnyView(swiftUIView))
        addChild(childView)
        //childView.view.frame = view.bounds
        view.addSubview(childView.view)
        childView.didMove(toParent: self)
        
        childView.view.translatesAutoresizingMaskIntoConstraints = false
        childView.view.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        childView.view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        childView.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        childView.view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
}
