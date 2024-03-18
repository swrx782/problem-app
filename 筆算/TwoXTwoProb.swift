//
//  TwoXTwoProb.swift
//  筆算
//
//  Created by 和田翔太 on 2024/01/03.
//





import SwiftUI





struct TwoXTwoProb: View {
    
    
    
    
    @State var isShowAnswer = false
    @State var firstNum = Int.random(in: 10...99)
    @State var secondNum = Int.random(in: 10...99)
    
    
    
    
    var body: some View {
        
        
        
        VStack {
            
            
            Text("\(firstNum) × \(secondNum)")
                .font(.system(size:180))
                .padding()
            
            
            HStack {
                
                // 問題変更ボタン
                Button {
                    // かけられる数の設定
                    firstNum = Int.random(in: 10...99)
                    // かける数の設定
                    secondNum = Int.random(in:10...99)
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
                    Answer(firstNum: $firstNum, secondNum: $secondNum)
                }
                .padding()
                
            }
            .font(.system(size:100))
            
            
        }
        
        
        
    }
    
    
    
    
}





#Preview {
    TwoXTwoProb()
}

