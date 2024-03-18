//
//  FourDivOneProb.swift
//  筆算
//
//  Created by 和田翔太 on 2024/02/09.
//





import SwiftUI





struct FourDivOneProb: View {
    
    
    
    
    @State var isShowAnswer = false
    @State var divisor  = -1
    @State var dividend = -1
    
    
    
    
    // 割る数と割られる数の変更
    func changeDivisorAndDivinded() {
        divisor  = Int.random(in: 2...9)
        dividend = Int.random(in: 1000...9999)
    }
    
    
    
    
    var body: some View {
        
        
        
        VStack {
            
            
            Text("\(dividend) ÷ \(divisor)")
                .font(.system(size:180))
                .padding()
            
            
            HStack {
                
                // 問題変更ボタン
                Button {
                    changeDivisorAndDivinded()
                } label: {
                    Text("問題を変える")
                }
                .background(.green)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding()

                
                NavigationLink(destination: FourDivOneAns(dividend: dividend, divisor: divisor)) {
                    Text("答えを\n見る")
                }
                .background(.red)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding()
                
            }
            .font(.system(size:100))
            
            
        }
        .onAppear {
            changeDivisorAndDivinded()
        }
        
 
        
    }
    
    
    
    
}





#Preview {
    FourDivOneProb()
}
