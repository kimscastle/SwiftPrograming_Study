import UIKit

// import
import Firebase
import FirebaseMessaging
import KakaoSDKCommon

@main
class AppDelegate: UIResponder, UIApplicationDelegate, MessagingDelegate  {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        KakaoSDK.initSDK(appKey: "41fe1b2427b435cc64f5875ed3de76ac")

        // Firebase 초기화 세팅.
        FirebaseApp.configure()

        // 메시지 대리자 설정
        Messaging.messaging().delegate = self

        // FCM 다시 사용 설정
        Messaging.messaging().isAutoInitEnabled = true

        // 푸시 알림 권한 설정 및 푸시 알림에 앱 등록
        UNUserNotificationCenter.current().delegate = self
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions, completionHandler: { _, _ in })

        // device token 요청.
        application.registerForRemoteNotifications()

        return true
    }

    /// 현재 등록 토큰 가져오기.
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        guard let fcmToken else { return }
        print("fcmToken: ", fcmToken)
    }


}

extension AppDelegate: UNUserNotificationCenterDelegate {
    /// APN 토큰과 등록 토큰 매핑
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound])
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let application = UIApplication.shared

        //앱이 켜져있는 상태에서 푸쉬 알림을 눌렀을 때
        if application.applicationState == .active {
            print("푸쉬알림 탭(앱 켜져있음)")
        }

        //앱이 꺼져있는 상태에서 푸쉬 알림을 눌렀을 때
        if application.applicationState == .inactive {
            print("푸쉬알림 탭(앱 꺼져있음)")
        }
    }

}

