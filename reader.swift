//
//  reader.swift
//  LoLi
//
//  Created by Z.Shang on 7/3/15.
//
//

import Foundation

func isBalanced(str: String) -> Bool{
    var count: Int = 0
    var quoted: Bool = false
    for char in str{
        if(char == "\""){
            quoted = !quoted
        }
        if(!quoted){
            if(char == "("){
                count++
            }
            if(char == ")"){
                if(count > 0){
                    count--
                }else{
                    println("Error: Redundant \")\"")
                    return false
                }
            }
        }
    }
    return (count == 0 && !quoted)
}