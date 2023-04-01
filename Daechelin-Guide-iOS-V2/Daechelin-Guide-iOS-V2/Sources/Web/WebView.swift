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
            Webview(url: URL(string: url)!)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    }
}

struct Webview: UIViewRepresentable {

    let url: URL

    func makeUIView(context: UIViewRepresentableContext<Webview>) -> WKWebView {
        let webview = WKWebView()
        let request = URLRequest(url: self.url, cachePolicy: .returnCacheDataElseLoad)
        webview.load(request)
        return webview
    }

    func updateUIView(_ webview: WKWebView, context: UIViewRepresentableContext<Webview>) {
        let request = URLRequest(url: self.url, cachePolicy: .returnCacheDataElseLoad)
        webview.load(request)
    }
}
