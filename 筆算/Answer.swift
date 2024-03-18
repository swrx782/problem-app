//
//  Answer.swift
//  筆算
//
//  Created by 和田翔太 on 2024/01/02.
//

import SwiftUI





struct Answer: View {
    
    
    
    
    @Binding var firstNum: Int
    @Binding var secondNum: Int
    
    
    
    
    var body: some View {
        
        
        
        let firstNumStr = String(firstNum)
        let secondNumStr = String(secondNum)
        
        let numStrWidth = CGFloat(30)
        let dotStrWidth = CGFloat(10)
        let strHeight   = CGFloat(50)
        let fontSize    = CGFloat(50)
        
        let boundaryLineW = CGFloat(270)
        let boundaryLineH = CGFloat(4)
        
        

        
        VStack{
            
            
            // 1行目(かけられる数)
            HStack {
                
                let zero = firstNumStr.startIndex
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: numStrWidth, height: strHeight)
                    Text(" ")
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: dotStrWidth, height: strHeight)
                    Text(" ")
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: numStrWidth, height: strHeight)
                    Text(" ")
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: dotStrWidth, height: strHeight)
                    Text(" ")
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: numStrWidth, height: strHeight)
                    Text(" ")
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: dotStrWidth, height: strHeight)
                    Text(" ")
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: numStrWidth, height: strHeight)
                    let index = firstNumStr.index(zero, offsetBy: 0)
                    Text(firstNumStr[index...index])
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: dotStrWidth, height: strHeight)
                    Text(" ")
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: numStrWidth, height: strHeight)
                    let index = firstNumStr.index(zero, offsetBy: 1)
                    Text(firstNumStr[index...index])
                }
                
            }.font(.system(size:fontSize))
            
            
            // 2行目(かける数)
            HStack {
                
                let zero = secondNumStr.startIndex
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 30, height: 50)
                    Text(" ")
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 10, height: 50)
                    Text(" ")
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 30, height: 50)
                    Text(" ")
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 10, height: 50)
                    Text(" ")
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 30, height: 50)
                    Text("×")
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 10, height: 50)
                    Text(" ")
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 30, height: 50)
                    let index = secondNumStr.index(zero, offsetBy: 0)
                    Text(secondNumStr[index...index])
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 10, height: 50)
                    Text(" ")
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 30, height: 50)
                    let index = secondNumStr.index(zero, offsetBy: 1)
                    Text(secondNumStr[index...index])
                }
                
            }.font(.system(size:fontSize))
            
            
            Rectangle().frame(width:boundaryLineW, height:boundaryLineH)
            
            
            // 3行目((かけられる数)*(かける数の1の位)の計算)
            HStack {
                
                let numStr = String(firstNum * (secondNum % 10))
                let organizedNumStr = String(repeating:" ", count: 3 - numStr.count) + numStr
                let zero = organizedNumStr.startIndex
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 30, height: 50)
                    Text(" ")
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 10, height: 50)
                    Text(" ")
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 30, height: 50)
                    Text(" ")
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 10, height: 50)
                    Text(" ")
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 30, height: 50)
                    let index = organizedNumStr.index(zero, offsetBy: 0)
                    Text(organizedNumStr[index...index])
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 10, height: 50)
                    Text(" ")
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 30, height: 50)
                    let index = organizedNumStr.index(zero, offsetBy: 1)
                    Text(organizedNumStr[index...index])
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 10, height: 50)
                    Text(" ")
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 30, height: 50)
                    let index = organizedNumStr.index(zero, offsetBy: 2)
                    Text(organizedNumStr[index...index])
                }
                
            }.font(.system(size:fontSize))
            
            
            // 4行目((かけられる数)*(かける数の10の位)の計算)
            HStack {
                
                let numStr = String(firstNum * ((secondNum / 10) % 10))
                let organizedNumStr = String(repeating:" ", count: 3 - numStr.count) + numStr
                let zero = organizedNumStr.startIndex
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 30, height: 50)
                    Text("+")
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 10, height: 50)
                    Text(" ")
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 30, height: 50)
                    let index = organizedNumStr.index(zero, offsetBy: 0)
                    Text(organizedNumStr[index...index])
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 10, height: 50)
                    Text(" ")
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 30, height: 50)
                    let index = organizedNumStr.index(zero, offsetBy: 1)
                    Text(organizedNumStr[index...index])
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 10, height: 50)
                    Text(" ")
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 30, height: 50)
                    let index = organizedNumStr.index(zero, offsetBy: 2)
                    Text(organizedNumStr[index...index])
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 10, height: 50)
                    Text(" ")
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 30, height: 50)
                    Text(" ")
                }
                
            }.font(.system(size:fontSize))
            
            
            Rectangle().frame(width:boundaryLineW, height:boundaryLineH)
            
            
            // 5行目(答えの部分)
            HStack {
                
                let numStr = String(firstNum * secondNum)
                let organizedNumStr = String(repeating:" ", count: 4 - numStr.count) + numStr
                let zero = organizedNumStr.startIndex
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 30, height: 50)
                    Text(" ")
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 10, height: 50)
                    Text(" ")
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 30, height: 50)
                    let index = organizedNumStr.index(zero, offsetBy: 0)
                    Text(organizedNumStr[index...index])
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 10, height: 50)
                    Text(" ")
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 30, height: 50)
                    let index = organizedNumStr.index(zero, offsetBy: 1)
                    Text(organizedNumStr[index...index])
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 10, height: 50)
                    Text(" ")
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 30, height: 50)
                    let index = organizedNumStr.index(zero, offsetBy: 2)
                    Text(organizedNumStr[index...index])
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 10, height: 50)
                    Text(" ")
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 30, height: 50)
                    let index = organizedNumStr.index(zero, offsetBy: 3)
                    Text(organizedNumStr[index...index])
                }
                
            }.font(.system(size:fontSize))
            
            
        }
    }
}

// #Preview {
//     Answer((Int)43)
// }
