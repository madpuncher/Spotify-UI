//
//  Home.swift
//  Spotify UI
//
//  Created by Eʟᴅᴀʀ Tᴇɴɢɪᴢᴏᴠ on 07.05.2021.
//

import SwiftUI

struct Home: View {
    @State var selectedTab = "house.fill"
    @State var volume: CGFloat = 0.4
    var body: some View {
        
        HStack(spacing: 0) {
            
            let lightWhite = Color.white.opacity(0.7)
            
            VStack {
                
                Image("spotify")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)
                    .padding(.top)
                
                VStack {
                    
                    TabButton(image: "house.fill", selectedTab: $selectedTab)
                    
                    TabButton(image: "safari.fill", selectedTab: $selectedTab)
                    
                    TabButton(image: "mic.fill", selectedTab: $selectedTab)
                    
                    TabButton(image: "clock.fill", selectedTab: $selectedTab)
                    
                }
                .frame(height: getRect().height / 2.3)
                
                Spacer(minLength: 50)
                
                Button(action: {
                    volume = volume + 0.1 < 1.0 ? volume + 0.1 : 1
                }, label: {
                    Image(systemName: "speaker.wave.2.fill")
                        .foregroundColor(.white)
                        .font(.title2)
                })
                
                GeometryReader { proxy in
                    
                    let height = proxy.frame(in: .global).height
                    let progress = height * volume
                    
                    ZStack(alignment: .bottom) {
                        
                        Capsule()
                            .fill(Color.gray.opacity(0.5))
                            .frame(width: 4)
                        
                        Capsule()
                            .fill(Color.white)
                            .frame(width: 4, height: progress)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                }
                .padding(.vertical, 20)
                
                Button(action: {
                    volume = volume - 0.1 > 0 ? volume - 0.1 : 0
                }, label: {
                    Image(systemName: "speaker.wave.1.fill")
                        .foregroundColor(.white)
                        .font(.title2)
                })
                
                Button(action: {
                   //
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(lightWhite)
                        .font(.title2)
                })
                .padding(.top, 30)
                .padding(.bottom, getSafeArea().bottom == 0 ? 15 : 0)

            }
            .frame(width: 80)
            .background(Color.black.ignoresSafeArea())
//            .offset(x: showSideBar ? 0 : -100)
            
            ScrollView(showsIndicators: false, content: {
                
                
            })
            .background(Color("bg").ignoresSafeArea())
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct TabButton: View {
    
    var image: String
    @Binding var selectedTab: String
    var body: some View {
        
        Button(action: {
            withAnimation { selectedTab = image }
        }, label: {
            Image(systemName: image)
                .font(.title)
                .foregroundColor(selectedTab == image ? .white : Color.gray.opacity(0.6))
                .frame(maxHeight: .infinity)
        })
    }
}

extension View {
    
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
    
    func getSafeArea() -> UIEdgeInsets {
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
