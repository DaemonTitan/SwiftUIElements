//
//  Notifcations.swift
//  UIElements
//
//  Created by Tony Chen on 27/2/2024.
//

import SwiftUI
import UserNotifications
import CoreLocation

class NotificationManager {
    static let instance = NotificationManager() // Singleton
    
    // Notification permission
    func notficationAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("ERROR: \(error)")
            }
        }
    }
    
    func scheduleNotfication() {
        let content = UNMutableNotificationContent()
        content.title = "This is notification titile"
        content.subtitle = "Notification sub titile"
        content.sound = .default
        content.badge = 1
        
        // Time trigger
        let timeTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        // Calender trigger
        // Sechedule notification will send out on specific time
        var dateComponents = DateComponents()
        dateComponents.hour = 20
        dateComponents.minute = 26
        dateComponents.weekday = 6 // Saturday
        let calenderTigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        // Location trigger
        let coordinates = CLLocationCoordinate2D(latitude: -33.726013,
                                                 longitude: 151.0941497)
        // It is circular region of coordinates
        let region = CLCircularRegion(center: coordinates,
                                      radius: 50,
                                      identifier: UUID().uuidString)
        // When user is in the region, notification sends
        region.notifyOnEntry = true
        // When user leaves the region, notification sends
        region.notifyOnExit = true
        let locationTrigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
        // Notification Request
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: calenderTigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotifcaiton() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
    
}

struct Notifcations: View {
    var body: some View {
        VStack(spacing: 40) {
            Button(action: {
                NotificationManager.instance.notficationAuthorization()
            }, label: {
                Text("Request permission")
            })
            
            Button(action: {
                NotificationManager.instance.scheduleNotfication()
            }, label: {
                Text("Schedule Time notification")
            })
            
            Button(action: {
                NotificationManager.instance.cancelNotifcaiton()
            }, label: {
                Text("Cancel notification")
            })
        }
        .onAppear {
            //UIApplication.shared.applicationIconBadgeNumber = 0
            UNUserNotificationCenter.current().setBadgeCount(0)
        }
    }
}

#Preview {
    Notifcations()
}
