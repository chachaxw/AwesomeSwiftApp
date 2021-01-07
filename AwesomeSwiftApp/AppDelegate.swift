//
//  AppDelegate.swift
//  AwesomeSwiftApp
//
//  Copyright © Chacha. All rights reserved.
//

import Log
import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate, WXApiDelegate {

    var window: UIWindow?
    let log = Logger()
    let universalLink: String = "https://app.ctirobot.com/"
    lazy private var router = RootRouter()
    lazy private var deeplinkHandler = DeeplinkHandler()
    lazy private var notificationsHandler = NotificationsHandler()

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()

        // Notifications
        notificationsHandler.configure()

        // 注册微信OpenSDK
        WXApi.registerApp("wxdcbe5709da8f1dd5", universalLink: universalLink)

        // App structure
        router.loadMainAppStructure()

        return true
    }

    func application(_ application: UIApplication,
                     continue userActivity: NSUserActivity,
                     restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        // To enable full universal link functionality add and configure the associated domain capability
        // https://developer.apple.com/library/content/documentation/General/Conceptual/AppSearch/UniversalLinks.html
        if userActivity.activityType == NSUserActivityTypeBrowsingWeb, let url = userActivity.webpageURL {
            deeplinkHandler.handleDeeplink(with: url)
        }
        return WXApi.handleOpenUniversalLink(userActivity, delegate: self)
    }

    func application(_ app: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        return WXApi.handleOpen(url, delegate: self)
    }

    func application(_ application: UIApplication,
                     didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        // To enable full remote notifications functionality you should first register the device with your api service
        //https://developer.apple.com/library/content/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/
        notificationsHandler.handleRemoteNotification(with: userInfo)
    }

    func onReq(_ req: BaseReq) {
        log.info("微信终端向第三方程序发起请求 \(req)")
    }

    func onResp(_ resp: BaseResp) {
        log.info("第三方程序向微信发送了请求 \(resp)")
    }
}
