//
//  base.swift
//  LoLi
//
//  Created by Z.Shang on 6/27/15.
//
//

import Foundation

public class loliObj{
    var type: loliType
    
    init(){
        self.type = L_OBJ
    }
    
    func toString() -> String {
        return "Object"
    }
    
    func eval(env: loliObj) ->loliObj{
        return self
    }
}

public class loliNum : loliObj{
    override init(){
        super.init()
        self.type = L_NUM
    }
    
    override func toString() -> String {
        return "Number"
    }
}

public class loliInt : loliNum{
    let value: Int
    
    init(value: Int){
        self.value = value
        super.init()
        self.type = L_INT
    }
    
    override func toString() -> String {
        return String(self.value)
    }
}

public class loliFlt : loliNum{
    let value: Double
    
    init(value: Double){
        self.value = value
        super.init()
        self.type = L_FLT
    }
    
    override func toString() -> String {
        return String(format:"%f", self.value)
    }
}

public class loliRat : loliNum{
    let d: Int
    let n: Int
    
    init(numerator: Int, denominator: Int) {
        self.n = numerator
        self.d = denominator
        super.init()
        self.type = L_RAT
    }
    
    override func toString() -> String {
        return String(self.n) + " / " + String(self.d)
    }
    
    override func eval(env: loliObj) -> loliObj{
        return loliFlt(value: Double(self.n) / Double(self.d))
    }
}

public class loliCons : loliObj{
    let head: loliObj
    let tail: loliObj
    
    init(head: loliObj, tail: loliObj) {
        self.head = head
        self.tail = tail
        super.init()
        self.type = L_CONS
    }
    
    override func toString() -> String {
        return "(" + head.toString() + " . " + tail.toString() + ")"
    }
}

public class loliSym : loliObj{
    let name: String
    
    init(name: String){
        self.name = name
        super.init()
        self.type = L_SYM
    }
    
    override func toString() -> String {
        return self.name
    }
}


public class loliKey : loliObj{
    let name: String
    
    init(name: String){
        self.name = name
        super.init()
        self.type = L_KEY
    }
    
    override func toString() -> String {
        return ":" + self.name
    }
}

public class loliBool : loliKey{
    let value: Bool
    
    init(value: Bool){
        self.value = value
        if(value){
            super.init(name: "TRUE")
        }else{
            super.init(name: "FALSE")
        }
        self.type = L_BOOL
    }
}

public class loliChar : loliObj{
    let value: Character
    
    init(value: Character){
        self.value = value
        super.init()
        self.type = L_CHAR
    }
    
    override func toString() -> String {
        return "#\\" + String(self.value);
    }
}

public class loliFn : loliObj{
    let returnType: loliType
    let argsType: loliType
    
    init(argsType: loliType, returnType: loliType) {
        self.argsType = argsType
        self.returnType = returnType
        super.init()
        self.type = L_FN
    }
    
    override func toString() -> String {
        return "Function: " + argsType.toString() + " -> " + returnType.toString()
    }
}

public class loliPrim : loliFn{
    let primFN: loliType -> loliType
    
    init(argsType: loliType, returnType: loliType, primFN: loliType -> loliType){
        self.primFN = primFN
        super.init(argsType: argsType, returnType: returnType)
    }
    
    override func toString() -> String {
        return "Primitive " + super.toString()
    }
}

public class loliLambda : loliFn{
    let exp: loliObj
    
    init(argsType: loliType, returnType: loliType, exp: loliObj){
        self.exp = exp
        super.init(argsType: argsType, returnType: returnType)
    }
    
    override func toString() -> String {
        return "Lambda Expression: " + argsType.toString() + " -> " + returnType.toString()
    }
}