//
//  Queue.swift
//  ExampleTODO
//
//  Created by LYJ on 21/05/2019.
//  Copyright © 2019 이영주. All rights reserved.
//

import Foundation

protocol Queue {
    associatedtype T
    mutating func push(_ element: T)
    mutating func pop() -> T?
    mutating func popAll() -> [T]
    func size() -> Int
    func isEmpty() -> Bool
}

struct ArrayQueue<T>: Queue {
    private var elements = Array<T>()
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        return elements.isEmpty ? nil : elements.removeFirst()
    }
    
    mutating func popAll() -> [T] {
        let result = elements
        elements.removeAll()
        return result
    }
    
    func size() -> Int {
        return elements.count
    }
    
    func isEmpty() -> Bool {
        return elements.isEmpty
    }
}

extension ArrayQueue: Sequence, IteratorProtocol {
    typealias Element = T
    mutating func next() -> T? { return pop() }
}

struct ThreadSafeArrayQueue<T>: Queue {
    private let lock = NSLock()
    private var queue = ArrayQueue<T>()

    mutating func push(_ element: T) {
        lock.lock()
        defer { lock.unlock() }
        queue.push(element)
    }
    
    mutating func pop() -> T? {
        lock.lock()
        defer { lock.unlock() }
        return queue.pop()
    }
    
    mutating func popAll() -> [T] {
        lock.lock()
        defer { lock.unlock() }
        return queue.popAll()
    }
    
    func size() -> Int {
        lock.lock()
        defer { lock.unlock() }
        return queue.size()
    }
    
    func isEmpty() -> Bool {
        lock.lock()
        defer { lock.unlock() }
        return queue.isEmpty()
    }
}

extension ThreadSafeArrayQueue: Sequence, IteratorProtocol {
    typealias Element = T
    mutating func next() -> T? { return pop() }
}
