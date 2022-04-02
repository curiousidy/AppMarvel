//
//  File.swift
//  marvelApp
//
//  Created by idaira aleman quintana on 29/3/22.
//

import Foundation
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG
import UIKit

extension String {
    static let comicsURL = "https://gateway.marvel.com/v1/public/comics?apikey=40b0cc30e08ab312f07aa4ced69b7474"
}

class NetworkLibrary{
    
    typealias CompletionHandlerArray = (_ response: [ComicsItem]) -> Void
    
    func getComics(_ completionHandlerArray:@escaping CompletionHandlerArray){
        var comicsURL = String.comicsURL + "&hash=b3e09acdde84de87cbc38734df3ead75"
        
        comicsURL += "&ts=1000"
        guard let url = URL(string:comicsURL) else {return}
        
        URLSession.shared.dataTask(with:url){
            data,response,error in
            
            do {
                guard let comicsJson = data else {return}
                let comics = try JSONDecoder().decode(ComicsResponse.self, from: comicsJson)
                completionHandlerArray(comics.data.results)
            } catch {
                completionHandlerArray([])
            }
            
        }.resume()
    }
    
    typealias CompletionHandlerUIImage = (_ response: UIImage) -> Void
    
    func getImage(path:String,type:String,_ completionHandlerUIImage:@escaping CompletionHandlerUIImage){
        var comicsImageUrl = path + "." + type
        
        guard let url = URL(string:comicsImageUrl) else {return}
        
        URLSession.shared.dataTask(with:url){
            data,response,error in
            print(data)
            
                guard let comicsImage = data else {return}
                let image = UIImage(data: comicsImage)
                completionHandlerUIImage(image ?? UIImage())
            
            }.resume()
        
    }
    
    func MD5(string: String) -> Data {
            let length = Int(CC_MD5_DIGEST_LENGTH)
            let messageData = string.data(using:.utf8)!
            var digestData = Data(count: length)

            _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
                messageData.withUnsafeBytes { messageBytes -> UInt8 in
                    if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                        let messageLength = CC_LONG(messageData.count)
                        CC_MD5(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                    }
                    return 0
                }
            }
            return digestData
        }

}


