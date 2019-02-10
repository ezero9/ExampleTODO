//
//  ApplicationContext.swift
//  ExampleTODO
//
//  Created by YoungJu Lee on 16/01/2019.
//  Copyright © 2019 이영주. All rights reserved.
//

import Foundation

class ApplicationContext  {
    private static var soleInstance: ApplicationContextInterface?
    
    
    static private func getInstance() -> ApplicationContextInterface {
        guard let soleInstance = self.soleInstance else {
            fatalError("ApplicationContext is not initialized")
        }
        
        return soleInstance
    }
    
    static func initialize(_ source: ApplicationContextType = .prod) {
        soleInstance = source.initialize()
    }
    
    static func destroy() {
        soleInstance = nil
    }
    
    static func getObject<T>(key: String) -> T {
        return getInstance().resolve(key: key)
    }
    
    static func resolve<T>() -> T {
        return getInstance().resolve()
    }
}

enum ApplicationContextType {
    case prod
    case test
    
    func initialize() -> ApplicationContextInterface {
        switch self {
        case .prod:
            return ProdApplicationContext()
        case .test:
            return TestApplicationContext()
        }
    }
}

protocol ApplicationContextInterface {
    func resolve<T>() -> T
    func resolve<T>(key: String) -> T
}

protocol CommonApplicationContextInterface: ApplicationContextInterface {
    func configure()
    func register<T>(_ assemble: @escaping () -> T)
    func register<T>(key: String, _ assemble: @escaping () -> T)
    func registerSingleton<T>(_ assemble: @escaping () -> T)
    func registerSingleton<T>(key: String, _ assemble: @escaping () -> T)
}


class CommonApplicationContext: CommonApplicationContextInterface {
    private(set) var factory = Assembler()
    private(set) var singletonMap = [String: Any]()
    init() {
         configure()
    }

    func resolve<T>() -> T {
        let key = String(describing: T.self)
        guard let object = singletonMap[key] as? T else {
            return factory.resolve() as T
        }
        return object
    }

    func resolve<T>(key: String) -> T {
        guard let object = singletonMap[key] as? T else {
            return factory.resolve(key: key)
        }
        return object
    }

    func configure() {
        
    }
    
    func register<T>(_ assemble: @escaping () -> T) {
        factory.register(assemble)
    }
    
    func register<T>(key: String, _ assemble: @escaping () -> T) {
        factory.register(key: key, assemble)
    }
    
    func registerSingleton<T>(_ assemble: @escaping () -> T) {
        self.register(assemble)
        let key = String(describing: T.self)
        singletonMap[key] = factory.resolve(key: key) as T
    }

    func registerSingleton<T>(key: String, _ assemble: @escaping () -> T) {
        self.register(key: key, assemble)
        singletonMap[key] = factory.resolve(key: key) as T
    }
}
