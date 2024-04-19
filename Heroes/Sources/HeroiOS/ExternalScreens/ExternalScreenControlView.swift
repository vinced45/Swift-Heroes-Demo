//
//  ExternalScreenControlView.swift
//  
//
//  Created by Vince Davis on 4/15/24.
//

import SwiftUI
import Observation

struct ExternalScreenControlView: View {
    @Bindable var viewModel: ScreenManager
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.heroOrange,.heroBlue]), startPoint: .top, endPoint: .bottom)
            
            HStack {
                Button(action: {
                    viewModel.minus()
                }, label: {
                    Image(systemName: "chevron.left")
                        .font(.largeTitle)
                        .foregroundStyle(viewModel.selection == 0 ? .gray : .white)
                        .bold()
                }).disabled(viewModel.selection == 0)
                
                Spacer()
                
                speakerTabView
                
                Spacer()
                
                Button(action: {
                    viewModel.add()
                }, label: {
                    Image(systemName: "chevron.right")
                        .font(.largeTitle)
                        .foregroundStyle(viewModel.selection == (viewModel.speakers.count - 1) ? .gray : .white)
                        .bold()
                }).disabled(viewModel.selection == (viewModel.speakers.count - 1))
            }
            .padding()
        }
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    var speakerTabView: some View {
        TabView(selection: $viewModel.selection) {
            ForEach(0..<viewModel.speakers.count) { i in
                VStack {
                    viewModel.speakers[i].image
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(10.0)
                    
                    Text(viewModel.speakers[i].name)
                        .font(.title)
                        .bold()
                }
                .tag(i)
            }
        }
        #if os(iOS)
        .tabViewStyle(PageTabViewStyle())
        #endif
        .animation(.easeInOut) // 2
        .transition(.slide)
    }
}

#Preview {
    ExternalScreenControlView(viewModel: ScreenManager())
}
