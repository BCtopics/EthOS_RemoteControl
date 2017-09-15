//: Playground - noun: a place where people can play

import UIKit

func fullHash(hashes: String) -> String {
    var hashes2 = hashes
    var hashTotalString = ""
    var hashTotal = 0.0
    var hashArray: [Double] = []
    var hashString = ""
    var counter = 1
    
    for i in hashes2.characters {
        if i == " " {
            hashArray.append(Double(hashString)!)
            hashString = ""
            counter += 1
        } else if hashes2.characters.count == counter {
            hashArray.append(Double(hashString)!)
            hashString = ""
        } else {
            hashString += "\(i)"
            counter += 1
        }
    }
    
    hashTotal = hashArray.reduce(0, +)
    hashTotalString = String(hashTotal)
    print(hashTotalString)
    return hashTotalString
}


fullHash(hashes: "32.93 32.95 29.59 22.80")