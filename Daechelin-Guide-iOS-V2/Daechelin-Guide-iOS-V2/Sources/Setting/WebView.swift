//
//  WebView.swift
//  Daechelin-Guide-iOS-V2
//
//  Created by 이민규 on 2023/04/01.
//

import SwiftUI
import WebKit
import LinkNavigator

struct WebView: View {
    
    @State var url: String = "https://sites.google.com/view/daechelin/%ED%99%88"
    
    let navigator: LinkNavigatorType
    
    var body: some View {
        Navigation("개인정보 처리방침", navigator) {
            WebKitView(url: URL(string: url)!)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    }
}

struct WebKitView: UIViewRepresentable {
 
    var url: URL
 
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
 
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
