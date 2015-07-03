//
//  typeclass.swift
//  LoLi
//
//  Created by Z.Shang on 6/27/15.
//
//

import Foundation

public class loliType{
    var name: String
    var id: String
    var parent: loliType?
    
    init(name: String, id: String){
        self.name = name
        self.id = id
        self.parent = nil
    }
    
    init(name: String, id: String, parent: loliType){
        self.name = name
        self.id = id
        self.parent = parent
    }
    
    func toString() -> String{
        return name
    }
    
    func getParent() -> loliType?{
        return self.parent
    }
    
}


func isDerived(type: loliType, from: loliType) -> Bool{
    if(type === from){
        return true
    }
    if(type.getParent() === from){
        return true
    }
    if(type.getParent() == nil){
        return false
    }
    return isDerived(type.getParent()!, from)
}

public let L_OBJ = loliType(name: "Object", id: "OBJ")
public let L_NUM = loliType(name: "Number", id: "NUM", parent: L_OBJ)
public let L_INT = loliType(name: "Integer", id: "INT", parent: L_NUM)
public let L_FLT = loliType(name: "Float", id: "FLT", parent: L_NUM)
public let L_RAT = loliType(name: "Rational", id: "RAD", parent: L_NUM)
public let L_CONS = loliType(name: "Cons", id: "CONS", parent: L_OBJ)
public let L_CHAR = loliType(name: "Character", id: "CHAR", parent: L_OBJ)
public let L_FN = loliType(name: "Function", id: "FN", parent: L_OBJ)
public let L_LAMBDA = loliType(name: "Lambda Expression", id: "LAMBDA", parent: L_FN)
public let L_PRIM = loliType(name: "Primitive", id: "PRIM", parent: L_FN)
public let L_SYM = loliType(name: "Symbol", id: "SYM", parent: L_OBJ)
public let L_KEY = loliType(name: "Keyword", id: "KEY", parent: L_OBJ)
public let L_BOOL = loliType(name: "Boolean", id: "BOOL", parent: L_KEY)
