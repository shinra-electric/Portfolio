//
//  MenuView.swift
//  AnimatedSideMenu
//
//  Created by シェイミ on 19/11/2021.
//
// Demo by Kavsoft https://youtu.be/dYfnxYhkehs

import SwiftUI

struct MenuView: View {
    @Binding var showMenu: Bool
    
    @Binding var animatePath: Bool
    @Binding var animateBG: Bool
    
    var body: some View {
        ZStack {
            BlurView(style: .systemUltraThinMaterialDark)
               
            // Blending with blue colour
            Color("BG2")
                .opacity(0.7)
                .blur(radius: 15)
            
            // Content
            VStack(alignment: .leading, spacing: 25) {
                Button {
                    // Close menu
                    
                    // Animate the Path with a slight delay
                    withAnimation(.interactiveSpring(response: 0.4, dampingFraction: 0.3, blendDuration: 0.3)) {
                        animatePath.toggle()
                    }
                    
                    withAnimation {
                        animateBG.toggle()
                    }
                    
                    withAnimation(.spring().delay(0.1)) {
                        showMenu.toggle()
                    }
                    

                    
                } label: {
                    Image(systemName: "xmark.circle")
                        .font(.title)
                }
                .foregroundColor(Color.white.opacity(0.8))
                
                // Menu Buttons
                MenuButton(title: "Premium Access", image: "square.grid.2x2", offset: 0)
                    .padding(.top, 40)
                MenuButton(title: "Upload Content", image: "square.and.arrow.up.on.square", offset: 10)
                MenuButton(title: "My Account", image: "Profile", offset: 30)
                MenuButton(title: "Make Money", image: "dollarsign.circle", offset: 10)
                MenuButton(title: "Help", image: "questionmark.circle", offset: 0)
                
                Spacer(minLength: 10)
                
                MenuButton(title: "Logout", image: "rectangle.portrait.and.arrow.right", offset: 0)
                
            }
            .padding(.trailing, 120)
            .padding()
            .padding(.top, getSafeArea().top)
            .padding(.bottom, getSafeArea().bottom)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
        .clipShape(MenuShape(value: animatePath ? 150 : 0))
        .background(
            MenuShape(value: animatePath ? 150 : 0)
                .stroke(
                    .linearGradient(.init(colors: [
                        Color("Blue"),
                        Color("Blue").opacity(0.7),
                        Color("Blue").opacity(0.5),
                        Color.clear
                    
                    ]), startPoint: .top, endPoint: .bottom),
                    lineWidth: animatePath ? 7 : 0
                )
                .padding(.leading, -50)
        )
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    func MenuButton(title: String, image: String, offset: CGFloat) -> some View {
        Button {
            
        } label: {
            HStack(spacing: 12) {
                if image == "Profile" {
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } else {
                    Image(systemName: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 25, height: 25)
                        .foregroundColor(.white)
                }
                
                Text(title)
                    .font(.system(size: 17))
                    .fontWeight(title == "Logout" ? .semibold : .medium)
                    .kerning(title == "Logout" ? 1.2 : 0.8)
                    .foregroundColor(Color.white.opacity(title == "Logout" ? 0.9 : 0.65))
            }
            .padding(.vertical)
        }
        .offset(x: offset)
    }
}

struct MenuShape: Shape {

    var value: CGFloat
    
    // Animating Path
    var animatableData: CGFloat {
        get { return value }
        set { value = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
            
            // For curve shape
            let width = rect.width - 100
            let height = rect.height
            
            path.move(to: CGPoint(x: width, y: height))
            path.addLine(to: CGPoint(x: 0, y: height))
            path.addLine(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: width, y: 0))
            
            // Curve
            path.move(to: CGPoint(x: width, y: 0))
            
            path.addCurve(to: CGPoint(x: width, y: height + 100),
                    control1: CGPoint(x: width + value, y: height / 3),
                    control2: CGPoint(x: width - value, y: height / 2))
            
        }
    }
}


// Extending View to get SafeArea

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
    
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
