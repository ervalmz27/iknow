//
//  WebView.swift
//  ikn
//
//  Created by Naufal on 29/11/23.
//

import Foundation
import SwiftUI
import WebKit

struct AppWebView : View{
    let urlString:String
    let title:String
    init(urlString: String, title: String) {
        self.urlString = urlString
        self.title = title
    }
    var body: some View{
        VStack{
            HStack{
                NavigationLink{
                    HomeUIView().navigationBarHidden(true)
                }label: {
                    Image(systemName: "arrow.backward").padding(.leading).bold().foregroundColor(Color("Dark 1"))
                }
                Spacer()
                Text(title).font(.system(size: 18).bold()).foregroundStyle(Color("Dark 1"))
                Spacer()
                Image(systemName: "house").padding(.trailing)
            }
            Divider()
            WebView(urlString: urlString)
        }
    }
}
struct WebView: UIViewRepresentable {
    let urlString: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView

        init(_ parent: WebView) {
            self.parent = parent
        }
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        AppWebView(urlString: "https://www.example.com", title: "Contoh")
    }
}

