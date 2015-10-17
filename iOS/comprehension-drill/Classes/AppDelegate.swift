import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        /*
        let aes256 = CocoaSecurity.aesEncrypt(
            "comprehension-drill-20151006",
            key: NSString(string: "happier-birthday-19860410-kenzan").dataUsingEncoding(NSUTF8StringEncoding),
            iv: NSString(string: "kenzan8000.org.c").dataUsingEncoding(NSUTF8StringEncoding)
        )
        print(aes256.base64)
        */
        /*
        let settings = UIUserNotificationSettings(forTypes: [.Badge, .Sound, .Alert], categories: nil)
        UIApplication.sharedApplication().registerForRemoteNotifications()
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
        */
        /*
        CPDArticleClient.sharedInstance.getArticle(
            offset: 1,
            count: 5,
            language: "en-us",
            completionHandler: { (json) in
            }
        )
        */
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
    }

    func applicationDidEnterBackground(application: UIApplication) {
    }

    func applicationWillEnterForeground(application: UIApplication) {
    }

    func applicationDidBecomeActive(application: UIApplication) {
    }

    func applicationWillTerminate(application: UIApplication) {
    }

    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        //print("deviceToken: \(deviceToken.description)")
    }

    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        //print("\(error)")
    }

    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        //print("\(userInfo)")
    }


}

