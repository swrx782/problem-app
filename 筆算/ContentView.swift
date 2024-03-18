//
//  ContentView.swift
//  筆算
//
//  Created by 和田翔太 on 2024/01/01.
//





import SwiftUI





struct ContentView: View {
    
    
    
    
    var body: some View {
        
        
        
        NavigationStack {
            
            
            VStack {
                
                NavigationLink(destination: TwoXTwoProb()) {
                    Text("2桁×2桁の掛け算")
                }.padding().padding()
                
                NavigationLink(destination: ThreeXTwoProb()) {
                    Text("3桁×2桁の掛け算")
                }.padding().padding()
                
                NavigationLink(destination: TwoXTwoWithDotProb()) {
                    Text("2桁×2桁(小数有)の掛け算")
                }.padding().padding()
                
                NavigationLink(destination: OneOrTwoDivOneNoRemaindProb()) {
                    Text("1~2桁÷1桁(余り無し)の割り算")
                }.padding().padding()
                
                NavigationLink(destination: OneOrTwoDivOneWithRemaindProb()) {
                    Text("1~2桁÷1桁(余り有り)の割り算")
                }.padding().padding()
                
                NavigationLink(destination: OneOrTwoDivOneProb()) {
                    Text("1~2桁÷1桁の割り算")
                }.padding().padding()
                
                NavigationLink(destination: ThreeDivOneProb()) {
                    Text("3桁÷1桁(筆算あり)の割り算")
                }.padding().padding()
                
                NavigationLink(destination: FourDivOneProb()) {
                    Text("4桁÷1桁(筆算あり)の割り算")
                }.padding().padding()
                
            }.font(.system(size: 50))
            
            
        }
        
        
                
    }
      
    
        
        
}
    




#Preview {
    ContentView()
}
