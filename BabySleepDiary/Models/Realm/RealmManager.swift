//
//  RealmManager.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 07/06/2023.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    @Published private(set) var sleeps: [Sleep] = []
    
    init() {
        openRealm()
        getSleeps()
    }
    
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            Realm.Configuration.defaultConfiguration = config
            localRealm = try Realm()
        } catch {
            print("Error opening Realm: \(error)")
        }
    }
    
    func addSleep(isNight: Bool, startTime: Date?, endTime: Date?) {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    let newSleep = Sleep(value: ["isNight": isNight, "startTime": startTime ?? Date(), "endTime": endTime ?? Date()] as [String : Any])
                    localRealm.add(newSleep)
                    getSleeps()
                    print("Added new baby to Realm: \(newSleep)")
                }
                
            } catch {
                print("Error adding baby to Realm: \(error)")
            }
        }
    }
    
    func getSleeps() {
        if let localRealm = localRealm {
            let allSleeps = localRealm.objects(Sleep.self).sorted(byKeyPath: "startTime")
            sleeps = []
            allSleeps.forEach { sleep in
                sleeps.append(sleep)
            }
        }
    }
}
