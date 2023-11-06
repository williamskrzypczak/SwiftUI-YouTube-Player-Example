//
//  ContentView.swift
//  SwiftUI YT Player Example
//
//  Created by Bill Skrzypczak on 11/6/23.
//

import SwiftUI
import WebKit

struct ContentView: View {
    var body: some View {
        EmbedFrameView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct EmbedView : UIViewRepresentable{
    let videoID : String
    
    func makeUIView(context: Context) -> WKWebView {
        return  WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else {return}
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeURL))
    }
}

struct EmbedFrameView: View{
    var body: some View{
        VStack{
            Text("Welcome to the video")
                .frame(width: 300, height: 500, alignment: .leading)
            
            HStack{
                VStack{
                    EmbedView(videoID: "fmWzy6LVebA")
                        .frame(width: 300, height: 150, alignment: .leading)
                        .cornerRadius(15)
                }
            }.frame(width: 320, height: 170)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.black, lineWidth: 4)
                )
                .background(Color.white)
                .cornerRadius(15)
            
        }
    }
    
    
        
        
}

        


