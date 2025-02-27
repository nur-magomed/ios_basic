//
//  AppCache.swift
//  hw16
//
//  Created by Nur-Magomed on 27.02.2025.
//
//  Singleton class

class AppCache {
    
    static let instance = AppCache()
    
    private var cache = [String: String]()
    
    private init(){}
    
    func get(key: String) -> String? {
        return cache[key]
    }
    
    func set(key: String, value: String) {
        cache[key] = value
    }
    
}
