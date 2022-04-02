//
//  Favorite.swift
//  marvelApp
//
//  Created by idaira aleman quintana on 29/3/22.
//

import Foundation
class Favorite{
    static var shared = Favorite()
    var comicsItems:[ComicsItem] = []
    
    
    func deleteFavorite(comic:ComicsItem){
        comicsItems = comicsItems.filter({
            $0.id != comic.id
        })
    }
    func addFavorite(comic:ComicsItem){
        comicsItems.append(comic)
    }

}

