//
//  Home.swift
//  Spotify UI
//
//  Created by Eʟᴅᴀʀ Tᴇɴɢɪᴢᴏᴠ on 07.05.2021.
//

import SwiftUI

struct Home: View {
    
    @State var searchText = ""
    
    var body: some View {
        
        HStack(spacing: 0) {
                        
            SideTabView()
            
            ScrollView(showsIndicators: false, content: {
                
                VStack(spacing: 15) {
                    
                    HStack(spacing: 15) {
                        
                        HStack(spacing: 15) {
                            
                            Circle()
                                .stroke(Color.white, lineWidth: 4)
                                .frame(width: 25, height: 25)
                            
                            TextField("Поиск...", text: $searchText)
                            
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(Color.white.opacity(0.08))
                        .cornerRadius(8)
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image("profile")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 45, height: 45)
                                .cornerRadius(10)
                        })
                    }
                    
                    Text("Недавно прослушано")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 30)

                    TabView {
                        
                        ForEach(recentlyPlayed) { item in
                            
                            GeometryReader { proxy in
                                
                                ZStack(alignment: .bottomLeading) {
                                    
                                    Image(item.album_cover)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .cornerRadius(20)
                                        .frame(width: proxy.frame(in: .global).width)
                                        .overlay(
                                            LinearGradient(gradient: .init(colors: [Color.clear, Color.black]), startPoint: .top, endPoint: .bottom)
                                                .cornerRadius(20)
                                        )
                                    
                                    HStack(spacing: 15) {
                                        
                                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                            Image(systemName: "play.fill")
                                                .font(.title)
                                                .foregroundColor(.white)
                                                .padding(20)
                                                .background(Color("logoColor"))
                                                .clipShape(Circle())
                                        })
                                        
                                        VStack(alignment: .leading, spacing: 5, content: {
                                            
                                            Text(item.album_name)
                                                .font(.title2)
                                                .fontWeight(.heavy)
                                                .foregroundColor(.white)
                                            
                                            Text(item.album_author)
                                                .font(.none)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                        })
                                    }
                                    .padding()
                                }
                            }
                            .padding(.horizontal)
                            .frame(height: 350)
                        }
                    }
                    .frame(height: 350)
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .padding(.top, 20)
                    
                    Text("Жанры")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 30)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 3), spacing: 25) {
                        
                        ForEach(generes, id: \.self) { genre in
                            
                            Text(genre)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.vertical, 8)
                                .frame(maxWidth:.infinity)
                                .background(Color.white.opacity(0.06))
                                .clipShape(Capsule())
                        }
                    }
                    .padding(.top, 20)
                    
                    Text("Понравившееся")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 30)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 2), spacing: 10) {
                        
                        ForEach(likedSongs.indices, id: \.self) { index in
                            
                            GeometryReader { proxy in
                                
                                Image(likedSongs[index].album_cover)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: proxy.frame(in: .global).width, height: 150)
                                    .clipShape(CustomCorners(corners: index % 2 == 0 ? [.topLeft, .bottomLeft] : [.topRight, .bottomRight], radius: 15))
                            }
                            .frame(height: 150)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                }
                .padding()
                .frame(maxWidth: .infinity)
            })
        }
        .background(Color("bg").ignoresSafeArea())
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct CustomCorners: Shape {
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}
