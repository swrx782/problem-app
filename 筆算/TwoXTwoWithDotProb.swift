//
//  TwoXTwoWithDotProb.swift
//  筆算
//
//  Created by 和田翔太 on 2024/01/04.
//





import SwiftUI





struct TwoXTwoWithDotProb: View {
    
    
    
    
    @State var isShowAnswer = false
    @State var  firstMantissa = Int.random(in: 10...99)
    @State var  firstExponent = Int.random(in: 0...2)
    @State var secondMantissa = Int.random(in: 10...99)
    @State var secondExponent = Int.random(in: 0...2)
    
    
    
    
    // 仮数,指数から小数文字を作成
    // 注)0.00123(=123*10**(-5))みたいな.の後に0が続くやつは想定していない
    func decimalNumStr(mantissa: Int, exponent: Int) -> String {
        
        var retStr = ""
        let mantissaStr = String(mantissa)
        let mantissaLen = mantissaStr.count
        
        // 0.??の場合の処理
        if mantissaLen == exponent {
            retStr += "0"
        }
        
        var nextIndex = 0
        for char in Array(mantissaStr){
            if nextIndex == mantissaLen - exponent {
                retStr += "."
            }
            retStr = retStr + String(char)
            nextIndex += 1
        }
        
        return retStr
        
    }
    
    
    
    
    var body: some View {
        
        
        
        VStack {
            
            
            let firstNumStr  = decimalNumStr(mantissa:  firstMantissa, exponent:  firstExponent)
            let secondNumStr = decimalNumStr(mantissa: secondMantissa, exponent: secondExponent)
            Text(firstNumStr + "×" + secondNumStr)
                .font(.system(size:140))
                .padding()
            
            
            HStack {
                
                // 問題変更ボタン
                Button {
                    // かけられる数の設定
                     firstMantissa = Int.random(in: 10...99)
                     firstExponent = Int.random(in: 0...2)
                    // かける数の設定
                    secondMantissa = Int.random(in: 10...99)
                    secondExponent = Int.random(in: 0...2)
                } label: {
                    Text("問題変更")
                }
                .padding()
                
                // 答えボタン
                Button {
                    isShowAnswer = true
                } label: {
                    Text("答え")
                }.sheet(isPresented: $isShowAnswer) {
                    TwoXTwoWithDotAns(
                         firstMantissa:  $firstMantissa,
                         firstExponent:  $firstExponent,
                        secondMantissa: $secondMantissa,
                        secondExponent: $secondExponent
                    )
                }
                .padding()
                
            }
            .font(.system(size:100))
            
            
        }
        
        
        
    }
    
    
    
    
}





#Preview {
    TwoXTwoWithDotProb()
}
