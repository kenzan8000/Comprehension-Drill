import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        /*
        let aes256 = CocoaSecurity.aesEncrypt(
            CPDUserRegistrationPassword,
            key: NSString(string: CPDUserRegistrationKey).dataUsingEncoding(NSUTF8StringEncoding),
            iv: NSString(string: CPDUserRegistrationIV).dataUsingEncoding(NSUTF8StringEncoding)
        )
        let app_secret = aes256.base64
        */
        /*
        let settings = UIUserNotificationSettings(forTypes: [.Sound, .Alert], categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
        UIApplication.sharedApplication().registerForRemoteNotifications()
        */
        //CPDArticle.request()
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
        //CPDLOG("deviceToken: \(deviceToken.description)")
    }

    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        //CPDLOG(error)
    }

    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        //CPDLOG(userInfo)
    }


}

