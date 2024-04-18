import SwiftUI
import Foundation
import Observation
import AVKit
import HeroShared

let appgroup = "group.com.45bitcode.UnitedWidgets"

@Observable
public class NotificationModel: NSObject {
    public override init() {
        
    }
    public var catergory: String = ""
    public var images: [URL?] = [
        Bundle.main.url(forResource: "heroes-1", withExtension: "jpg"),
        Bundle.main.url(forResource: "heroes-2", withExtension: "jpg"),
        Bundle.main.url(forResource: "heroes-3", withExtension: "jpg")
    ]
    public var starCount: Int = 3
    public var selection: Int = 0
    public var label: String = ""
    public var start: Double = 1.0
    public var player: AVPlayer = AVPlayer(url: Bundle.main.url(forResource: "highlights", withExtension: "mp4")!)
    public func set(text: String) {
        label = text
    }
    public func restart() {
        start = 0
    }
    public func play() {
        player.play()
    }
    public func pause() {
        player.pause()
    }
    public func slide() {
        if selection >= 4 {
            selection = 0
        } else {
            selection += 1
        }
    }
    public func changeRating() {
        if starCount >= 5 {
            starCount = 0
        } else {
            starCount += 1
        }
    }
}

public struct NotificationView: View {
    public init(viewModel: NotificationModel) {
        self.viewModel = viewModel
    }
    @State var viewModel: NotificationModel
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    public var body: some View {
        switch viewModel.catergory {
        case "video": videoView
        case "images": imageCarosel
        default: defaultView
        }
    }
    var defaultView: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.heroOrange,.heroBlue ]), startPoint: .top, endPoint: .bottom)
            
            VStack(alignment: .center) {
                HStack {
                    Image.logo
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(10.0)
                    
                    Image.wordLogo
                        .resizable()
                        .frame(height: 75)
                }
        
                Text("How did you enjoy the talk?")
                    .font(.title2)
                
                Button(action: {
                    viewModel.changeRating()
                }, label: {
                    starRow
                })
            }
            .ignoresSafeArea()
            .padding()
        }
    }
    
    var starRow: some View {
        HStack(spacing: 20) {
            ForEach(1..<6) { i in
                let image = (i <= viewModel.starCount) ? "star.fill" : "star"
                Image(systemName: image)
                    .font(.title3)
                    .foregroundColor(.yellow)
            }
        }
    }
    
    var videoView: some View {
        VideoPlayer(player: viewModel.player)
    }
    
    var imageCarosel: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.heroOrange,.heroBlue ]), startPoint: .top, endPoint: .bottom)
            
            TabView(selection: $viewModel.selection) {
                ForEach(0..<viewModel.images.count) { i in
                    AsyncImage(
                        url: viewModel.images[i],
                        content: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                 //.frame(maxWidth: 300, maxHeight: 100)
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                    .tag(i)
                }
            }
            #if os(iOS)
            .tabViewStyle(PageTabViewStyle())
            #endif
            .animation(.easeInOut) // 2
            .transition(.slide) // 3
        }.ignoresSafeArea()
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(viewModel: NotificationModel())
    }
}
