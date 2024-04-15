//
//  File.swift
//  
//
//  Created by Vince Davis on 4/8/24.
//

import Foundation
import SwiftUI
import HeroShared

public extension View {
    func externalScreen<ScreenContent>(_ showingExternalScreen: Binding<Bool>, screenContent: @escaping () -> ScreenContent) -> some View where ScreenContent: View {
        modifier(ExternalScreenViewModifier(showingExternalScreen: showingExternalScreen,  screenContent: screenContent))
    }
    
    func backgroundScreen<ScreenContent>(_ inBackground: Binding<Bool>, screenContent: @escaping () -> ScreenContent) -> some View where ScreenContent: View {
        modifier(ForegroundViewModifier(inBackground: inBackground, screenContent: screenContent))
    }
    
    func externalScreenToolbar(screenManager: ScreenManager, showingSheet: Binding<Bool>) -> some View {
        return self.modifier(ExternalScreenToolBarModifier(screenManager: screenManager, showingSheet: showingSheet))
    }
    
    @ViewBuilder
    func ifOS<Content: View>(_ operatingSystems: OperatingSystem...,modifier: (Self) -> Content) -> some View {
        if operatingSystems.contains(OperatingSystem.current) {
            modifier(self)
        } else {
            self
        }
    }

    func modify<T: View>(@ViewBuilder modifier: (Self) -> T) -> T {
        modifier(self)
    }
    
    func customToolBarStyle() -> some View {
        self
        #if os(iOS)
            .toolbarBackground(Color.heroOrange.gradient, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        #endif
    }
    
//    #if os(iOS)
//    // This function changes our View to UIView, then calls another function
//    // to convert the newly-made UIView to a UIImage.
//    func asUIImage() -> UIImage {
//        let controller = UIHostingController(rootView: self)
//            
//        // Set the background to be transparent incase the image is a PNG, WebP or (Static) GIF
//        controller.view.backgroundColor = .clear
//            
//        controller.view.frame = CGRect(x: 0, y: CGFloat(Int.max), width: 1, height: 1)
//        UIApplication.shared.windows.first!.rootViewController?.view.addSubview(controller.view)
//            
//        let size = controller.sizeThatFits(in: UIScreen.main.bounds.size)
//        controller.view.bounds = CGRect(origin: .zero, size: size)
//        controller.view.sizeToFit()
//            
//        // here is the call to the function that converts UIView to UIImage: `.asUIImage()`
//        let image = controller.view.asUIImage()
//        controller.view.removeFromSuperview()
//        return image
//    }
//    #endif
}

//#if os(iOS)
//public extension UIView {
//// This is the function to convert UIView to UIImage
//    func asUIImage() -> UIImage {
//        let renderer = UIGraphicsImageRenderer(bounds: bounds)
//        return renderer.image { rendererContext in
//            layer.render(in: rendererContext.cgContext)
//        }
//    }
//}
//#endif
