//
//  ThreeDivOneAns2.swift
//  筆算
//
//  Created by 和田翔太 on 2024/02/05.
//

import SwiftUI

struct ThreeDivOneAns2: View {
    
    /*
    @Binding var divisor: Int
    @Binding var dividend: Int
    */
    
    @State var dividend = 730
    @State var divisor  = 3
    
    // 商と余りを求めて答えの文字列を返す
    func ansStr(divided: Int, divisor: Int) -> String {
        let quotient = dividend / divisor
        let reminder = dividend % divisor
        return String(quotient) + ((reminder == 0) ?  "" : "•••kkkkk"+String(reminder))
    }
    
    
    var body: some View {
        
        let fontSize    = CGFloat(170)
        
        VStack {
            Text("aiueo")
        }.font(.system(size:fontSize))
        
    }
    
    
}


 #Preview {
 ThreeDivOneAns2()
 }
 
