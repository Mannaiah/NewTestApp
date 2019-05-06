//
//  NotificationVC.swift
//  Basics
//
//  Created by M Venkat  Rao on 4/1/19.
//  Copyright © 2019 M Venkat  Rao. All rights reserved.
//

import UIKit
import UserNotifications

class NotificationVC: UIViewController,UNUserNotificationCenterDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        self.navigationController?.navigationBar.topItem?.title = "Notifications"
         self.navigationItem.title = "Notifications"
        
        UNUserNotificationCenter.current().requestAuthorization(options:[.alert,.sound,.badge], completionHandler:{didAlow,error in })
        
    }
    
    @IBAction func createNotificationAction(_ sender: UIButton) {
        
       let content = UNMutableNotificationContent()
        content.title = "Hey this is simplifyed ios App"
        content.subtitle = "iOS development is fun"
        content.body = "We are learning about ios local notifications"
        content.badge = 1
        content.launchImageName =  "nature.png"
        
        
        //let url = Bundle.main.url(forResource: "nature", withExtension: "png")
        
//        let attachment = try! UNNotificationAttachment(identifier: "image", url: url!, options: [:])
//        content.attachments = [attachment]
        
        let triger = UNTimeIntervalNotificationTrigger(timeInterval:66.5, repeats: true)
        let request = UNNotificationRequest(identifier:"SimplifyedIosNotification", content:content, trigger:triger)
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().add(request, withCompletionHandler:nil)
        
        
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert,.sound,.badge])
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
