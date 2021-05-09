//
//  Song.swift
//  Spotify UI
//
//  Created by Eʟᴅᴀʀ Tᴇɴɢɪᴢᴏᴠ on 07.05.2021.
//

import SwiftUI

struct Song: Identifiable {
    
    var id = UUID().uuidString
    var album_name: String
    var album_author: String
    var album_cover: String
}

var recentlyPlayed = [
    
    Song(album_name: "Патрон", album_author: "Miyagi & Andy Panda", album_cover: "p2"),
    Song(album_name: "Montero", album_author: "Lil Nax X", album_cover: "p3"),
    Song(album_name: "Лилии", album_author: "Mot, Jony", album_cover: "p4"),
    Song(album_name: "Эйя", album_author: "Канги", album_cover: "p5"),
    
]

var likedSongs = [

//    Song(album_name: "America on fire", album_author: "David Sabastian", album_cover: "p1"),
    Song(album_name: "Astronaut In The Ocean", album_author: "Masked Wolf", album_cover: "p6"),
    Song(album_name: "Пустота", album_author: "Jony", album_cover: "p7"),
    Song(album_name: "BESTSELLER", album_author: "Макс Барских ,Zivert", album_cover: "p8"),
    Song(album_name: "Голос", album_author: "Егор Крид", album_cover: "p9"),
    Song(album_name: "неболей", album_author: "Баста, Zivert", album_cover: "p10"),
    Song(album_name: "Take You Dancing", album_author: "Jason Derulo", album_cover: "p11"),
    Song(album_name: "Lovefool", album_author: "twocolors", album_cover: "p12"),
    Song(album_name: "По щекам слёзы", album_author: "HENSY, Клава Кока", album_cover: "p13"),
    Song(album_name: "Костёр", album_author: "Miyagi & Andy Panda", album_cover: "p14"),
    Song(album_name: "Поболело и прошло", album_author: "HENSY", album_cover: "p15"),
    
]

var generes = ["Классика", "Хип-Хоп", "Электро", "Чилаут", "Дарк"]
