import SwiftUI
import Combine
#if os(iOS)
import UIKit

public struct ExternalScreenViewModifier<ScreenContent: View>: ViewModifier where ScreenContent: View {
    @Binding var showingExternalScreen: Bool
    let screenContent: () -> ScreenContent
    
    @State var additionalWindows: [UIWindow] = []
    
    public func body(content: Content) -> some View {
        content
            .onReceive(
                screenDidConnectPublisher,
                perform: screenDidConnect
            )
            .onReceive(
                screenDidDisconnectPublisher,
                perform: screenDidDisconnect
            )
    }
    
    private var screenDidConnectPublisher: AnyPublisher<UIScreen, Never> {
        NotificationCenter.default
            .publisher(for: UIScreen.didConnectNotification)
            .compactMap { $0.object as? UIScreen }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }

    private var screenDidDisconnectPublisher: AnyPublisher<UIScreen, Never> {
        NotificationCenter.default
            .publisher(for: UIScreen.didDisconnectNotification)
            .compactMap { $0.object as? UIScreen }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    private func screenDidConnect(_ screen: UIScreen) {
        let window = UIWindow(frame: screen.bounds)

        window.windowScene = UIApplication.shared.connectedScenes
            .first { ($0 as? UIWindowScene)?.screen == screen }
            as? UIWindowScene

        let controller = UIHostingController(rootView: screenContent())
        window.rootViewController = controller
        window.isHidden = false
        additionalWindows.append(window)
        showingExternalScreen = true
    }

    private func screenDidDisconnect(_ screen: UIScreen) {
        additionalWindows.removeAll { $0.screen == screen }
        showingExternalScreen = false
    }
}
#endif
