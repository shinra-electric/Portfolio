//
//  SampleCards.swift
//  CurvedTabBar
//
//  Created by Xianmo on 16/09/2021.
//

import SwiftUI

// Sample banner cards
@ViewBuilder
func SampleBannerCards(bottomSafeArea: CGFloat) -> some View {
    NavigationView {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                ForEach(1...7, id: \.self) { index in
                    Image("banner\(index)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width - 30, height: 180)
                        .cornerRadius(12)
                }
            }
            .padding()
            // Approximate bottom padding
            // 30 size
            // padding = 30
            // Bottom edge
            .padding(.bottom, 60)
            .padding(.bottom, bottomSafeArea == 0 ? 15 : bottomSafeArea)
        }
        .navigationTitle("TV Shows")
    }
}

// Sample square cards
@ViewBuilder
func SampleSquareCards(bottomSafeArea: CGFloat) -> some View {
    NavigationView {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                ForEach(1...14, id: \.self) { index in
                    Image("square\(index)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width - 30, height: 350)
                        .cornerRadius(12)
                }
            }
            .padding()
            // Approximate bottom padding
            // 30 size
            // padding = 30
            // Bottom edge
            .padding(.bottom, 60)
            .padding(.bottom, bottomSafeArea == 0 ? 15 : bottomSafeArea)
        }
        .navigationTitle("Music")
    }
}

// Sample poster cards
@ViewBuilder
func SamplePosterCards(bottomSafeArea: CGFloat) -> some View {
    NavigationView {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                ForEach(1...9, id: \.self) { index in
                    Image("poster\(index)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width - 30, height: 500)
                        .cornerRadius(12)
                }
            }
            .padding()
            // Approximate bottom padding
            // 30 size
            // padding = 30
            // Bottom edge
            .padding(.bottom, 60)
            .padding(.bottom, bottomSafeArea == 0 ? 15 : bottomSafeArea)
        }
        .navigationTitle("Films")
    }
}



// The below is an attemt to refactor the above views. I did not finish as I got some unexpected results...
// There was a nice animation between the tabs, but it flashed to the top of the scrollbar before remembering where it was.


// Sample cards
//@ViewBuilder
//func SampleCards(currentTab: Tab, bottomSafeArea: CGFloat) -> some View {
//    NavigationView {
//        ScrollView(.vertical, showsIndicators: false) {
//            VStack(spacing: 15) {
//                switch(currentTab) {
//                case .tv:
//                    TVSampleCards()
//                case .music:
//                    MusicSampleCards()
//                case .films:
//                    FilmSampleCards()
//                case .account:
//                    Image(systemName: "gear")
//                }
//
//
//            }
//            .padding()
//            // Approximate bottom padding
//            // 30 size
//            // padding = 30
//            // Bottom edge
//            .padding(.bottom, 60)
//            .padding(.bottom, bottomSafeArea == 0 ? 15 : bottomSafeArea)
//        }
//        .navigationTitle("Test")
//    }
//}
//
//
//struct TVSampleCards: View {
//    var body: some View {
//        ForEach(1...7, id: \.self) { index in
//            Image("banner\(index)")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: UIScreen.main.bounds.width - 30, height: 180)
//                .cornerRadius(12)
//        }
//    }
//}
//
//
//struct MusicSampleCards: View {
//    var body: some View {
//        ForEach(1...14, id: \.self) { index in
//            Image("square\(index)")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: UIScreen.main.bounds.width - 30, height: 350)
//                .cornerRadius(12)
//        }
//    }
//}
//
//struct FilmSampleCards: View {
//    var body: some View {
//        ForEach(1...9, id: \.self) { index in
//            Image("poster\(index)")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: UIScreen.main.bounds.width - 30, height: 500)
//                .cornerRadius(12)
//        }
//    }
//}
