//
//  CustomTabBar.swift
//  CustomTabBar
//
//  Created by シェイミ on 10/09/2021.
//

import SwiftUI

struct CustomTabBar: View {
    // Current Tab
    @State private var currentTab: Tab = .tv
    
    // Hide native tab bar
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    // Matched Geometry Effect
    @Namespace var animation
    
    // Current tab  X value
    @State private var currentXValue: CGFloat = 0
    

    var body: some View {
        TabView(selection: $currentTab) {
            
            SampleBannerCards(bottomSafeArea: getSafeArea().bottom)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("BG").ignoresSafeArea())
                .tag(Tab.tv)
            SampleSquareCards(bottomSafeArea: getSafeArea().bottom)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("BG").ignoresSafeArea())
                .tag(Tab.music)
            SamplePosterCards(bottomSafeArea: getSafeArea().bottom)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("BG").ignoresSafeArea())
                .tag(Tab.films)
            HStack {
                Image(systemName: "gear")
                Text("Account")
            }
            .tag(Tab.account)
            
        }
        // Curved Tab Bar
        .overlay(
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    TabButton(tab: tab)
                }
            }
                .padding(.vertical)
                .padding(.bottom, getSafeArea().bottom == 0 ? 10 : (getSafeArea().bottom - 10))
                .background(
                    MaterialEffect(style: .systemUltraThinMaterialDark)
                        .clipShape(BottomCurve(currentXValue: currentXValue))
                    
                )
            
            , alignment: .bottom
        )
        .ignoresSafeArea(.all, edges: .bottom)
        .preferredColorScheme(.dark)
    }
    
    
    
    // TabButton
    @ViewBuilder
    func TabButton(tab: Tab) -> some View {
        GeometryReader { proxy in
            
            Button {
                
                withAnimation(.spring()) {
                    currentTab = tab
                    // Updating value
                    currentXValue = proxy.frame(in: .global).midX
                }
                
            } label: {
                
                // Move the button up for the current tab
                
                
                
                
                Image(systemName: tab.rawValue)
                // We need an exact value for the curve
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding(currentTab == tab ? 15: 0)
                    .background(
                        ZStack {
                            if currentTab == tab {
                                MaterialEffect(style: .systemChromeMaterialDark)
                                    .clipShape(Circle())
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                            }
                        }
                    
                    )
                    .contentShape(Rectangle())
                    .offset(y: currentTab == tab ? -50 : 0)
            }
            // Setting initial curve position
            .onAppear {
                if tab == Tab.allCases.first && currentXValue == 0 {
                    currentXValue = proxy.frame(in: .global).midX
                }
            }
            
        }
        // Max size
        .frame(height: 30)
    }
}


enum Tab: String, CaseIterable {
    case tv = "tv"
    case music = "music.note.list"
    case films = "list.and.film"
    case account = "person.fill"
}

// Get the safe area
extension View {
    
    func getSafeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        
        return safeArea
    }
}



struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}
