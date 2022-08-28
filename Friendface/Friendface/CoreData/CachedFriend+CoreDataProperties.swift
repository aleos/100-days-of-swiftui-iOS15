//
//  CachedFriend+CoreDataProperties.swift
//  Friendface
//
//  Created by Alexander Ostrovsky on 28.08.2022.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    
    @NSManaged public var user: CachedUser?

    var wrappedName: String {
        name ?? ""
    }
    
    convenience init(friend: Friend, context: NSManagedObjectContext) {
        self.init(context: context)
        
        id = friend.id
        name = friend.name
    }
}

extension CachedFriend : Identifiable {

}
