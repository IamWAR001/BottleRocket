//
//  InternetViewController.swift
//  BottleRocketAssignement
//
//  Created by  Created by Nicholas Gilbert on 4/15/21.
//

import UIKit
import WebKit

class InternetViewController: UIViewController {
    lazy var internetView: WKWebView = {
        let internetView = WKWebView(frame: .zero)
        internetView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(internetView)
        return internetView
    }()
    var webViewRefreshButton:UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigationBar()
        self.loadWebPage()
        view.addSubview(internetView)
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        internetView.frame = view.bounds
        guard let url = URL(string: "https://www.bottlerocketstudios.com") else { return }
        internetView.load(URLRequest(url: url))
    }
    private func configureNavigationBar(){
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 67/255, green: 232/255, blue: 149/255, alpha: 0)
//       
        let webBackButton = UIBarButtonItem(image: UIImage(named: "ic_webBack"), style: .plain, target: self, action: #selector(self.webBackButtonSelected))
        webBackButton.tintColor = .white
        
        let button = UIButton()
        button.setImage(UIImage(named:"ic_webRefresh"), for: .normal)
        button.addTarget(self, action: #selector(self.webRefreshButtonSelected), for: .touchUpInside)
        let webRefreshButton = UIBarButtonItem(customView: button)
        webRefreshButton.tintColor = .white
        self.webViewRefreshButton = button
        
        let webForwardButton = UIBarButtonItem(image: UIImage(named: "ic_webForward"), style: .plain, target: self, action: #selector(self.webForwardButtonSelected))
        webForwardButton.tintColor = .white
        
        self.navigationItem.setLeftBarButtonItems([webBackButton,webRefreshButton,webForwardButton], animated: false)
    }
    func configureUI(){
        view.backgroundColor = .systemRed
    }
    func loadWebPage(){
        guard let url = URL(string: "https://www.bottlerocketstudios.com") else { return }
        self.internetView.load(URLRequest(url: url))
    }
    @objc func webBackButtonSelected(){
        self.internetView.goBack()
    }
    @objc func webForwardButtonSelected(){
        self.internetView.goForward()
    }
    @objc func webRefreshButtonSelected(){
        if self.internetView.isLoading{
            self.internetView.stopLoading()
            self.webViewRefreshButton?.setImage(UIImage(named: "ic_webRefresh"), for: .normal)
        }else{
            self.internetView.reload()
            self.webViewRefreshButton?.setImage(UIImage(named: "ic_close"), for: .normal)
        }
    }
}
extension InternetViewController:WKNavigationDelegate{
    func internetView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.webViewRefreshButton?.setImage(UIImage(named: "ic_webRefresh"), for: .normal)
    }
}
