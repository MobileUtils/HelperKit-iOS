//
//  CacheManager.swift
//  HelperKit
//
//  Created by Basheer Ahamed.S on 30/05/21.
//

import Foundation

open class CacheRecord {
    var key: String!
    open var object: AnyObject?
    fileprivate var cachedDateTime: Date!
    var cacheMinutes: Int = 30

    convenience init(object: AnyObject?, key: String, minutes: Int) {
        self.init()
        self.object = object
        self.key = key
        self.cacheMinutes = minutes
    }

    init() {
        self.cachedDateTime = Date()
    }
}

public class CacheManager {

    private var cache = NSCache<AnyObject, AnyObject>()

    public init() { }
    
    open func save(_ record: CacheRecord) {
        self.cache.setObject(record, forKey: record.key as AnyObject)
    }

    open func saveObject(_ object: AnyObject?, forKey key: String, forMinutes minutes: Int) {
        let record = CacheRecord(object: object, key: key, minutes: minutes)
        self.save(record)
    }

    open func fetchObject<T>(forKey key: String) -> T? {
        return self.fetch(forKey: key)?.object as? T
    }

    open func fetch(forKey key: String) -> CacheRecord? {
        guard let record = self.cache.object(forKey: key as AnyObject) as? CacheRecord else {
            return nil
        }
        if record.cachedDateTime.addMinutes(record.cacheMinutes).isGreaterThanDate(Date()) {
            return record
        } else {
            self.removeObject(key: key)
            return nil
        }
    }
    
    open func removeObject(key: String) {
        self.cache.removeObject(forKey: key as AnyObject)
    }

    open func removeObjects(keys: [String]) {
        keys.forEach({
            self.cache.removeObject(forKey: $0 as AnyObject)
        })
    }
    
    open func removeAllObjects() {
        self.cache.removeAllObjects()
    }
}
