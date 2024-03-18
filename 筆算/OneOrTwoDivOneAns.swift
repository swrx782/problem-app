//
//  OneOrTwoDivOneAns.swift
//  筆算
//
//  Created by 和田翔太 on 2024/01/14.
//



import SwiftUI



struct OneOrTwoDivOneAns: View {
    
    
    @Binding var divisor: Int
    @Binding var dividend: Int
    
    // 商と余りを求めて答えの文字列を返す
    func ansStr(divided: Int, divisor: Int) -> String {
        let quotient = dividend / divisor
        let reminder = dividend % divisor
        return String(quotient) + ((reminder == 0) ?  "" : "•••"+String(reminder))
    }
    
    
    var body: some View {
        
        let fontSize    = CGFloat(170)
        
        VStack {
            Text(ansStr(divided: dividend, divisor: divisor))
        }.font(.system(size:fontSize))
        
    }
    
    
}
