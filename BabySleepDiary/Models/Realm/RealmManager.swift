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
                    print("Added new sleep to Realm: \(newSleep)")
                }
                
            } catch {
                print("Error adding sleep to Realm: \(error)")
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
    
    func updateSleep(id: ObjectId, isNight: Bool, startTime: Date, endTime: Date) {
        if let localRealm = localRealm {
            do {
                let sleepToUpdate = localRealm.objects(Sleep.self).filter(NSPredicate(format: "id == %@", id))
                guard !sleepToUpdate.isEmpty else { return }
                try localRealm.write {
                    sleepToUpdate[0].isNight = isNight
                    sleepToUpdate[0].startTime = startTime
                    sleepToUpdate[0].endTime = endTime
                    getSleeps()
                    print("Updated sleep with id \(id)! Other parameters: isNight is \(isNight), startTime is \(startTime), endTime is \(endTime)")
                }
            } catch {
                print("Error editing sleep \(id) to Realm: \(error)")
            }
        }
    }
    
    func deleteSleep(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                let sleepToDelete = localRealm.objects(Sleep.self).filter(NSPredicate(format: "id == %@", id))
                guard !sleepToDelete.isEmpty else { return }
                try localRealm.write {
                    localRealm.delete(sleepToDelete)
                    getSleeps()
                    print("Deleted sleep with id \(id)")
                }
            } catch {
                print("Error deleting sleep \(id) from Realm: \(error)")
            }
        }
    }
}
