//
//  WebView.swift
//  DailyNews
//
//  Created by Karthick Selvaraj on 16/09/21.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    typealias UIViewType = WKWebView
    
    var url: URL?
    
    @Binding var isLoading: Bool
    
    func makeCoordinator() -> WebViewCoordinator {
        WebViewCoordinator(isLoading: $isLoading)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = url else { return WKWebView() }
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        
        let reqeuest = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        webView.load(reqeuest)
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        // Do nothing
    }
    
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(url: URL(string: "https://www.apple.com"), isLoading: .constant(false))
    }
}

class WebViewCoordinator: NSObject, WKNavigationDelegate {
    
    @Binding var isLoading: Bool
    
    init(isLoading: Binding<Bool>) {
        self._isLoading = isLoading
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        isLoading = false
        print("🔵 webview didFinishNavigation")
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        isLoading = true
        print("🔵 didStartProvisionalNavigation")
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("🔵 webviewDidCommit")
    }
    
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        print("🔵 didReceiveAuthenticationChallenge")
        completionHandler(.performDefaultHandling, nil)
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        isLoading = false
        print("🔴 didFail navigation")
    }
    
}
