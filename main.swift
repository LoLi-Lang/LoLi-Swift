//
//  main.swift
//  LoLi
//
//  Created by Z.Shang on 6/28/15.
//
//

import Foundation

let testCons = loliCons(head: L_T, tail: L_NIL)
let testCons2 = loliCons(head: L_T, tail:testCons)
println(testCons2.toString())

println(loliCons(head: loliRat(numerator: 1, denominator: 2), tail: L_NIL).toString())

println(loliCons(head: loliKey(name: "LoLi"), tail: loliSym(name: "Symbol")).toString())

println(loliBool(value: false).toString())
