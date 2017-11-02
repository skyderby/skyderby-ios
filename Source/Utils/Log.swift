//
//  Log.swift
//
//  Copyright © 2017 Evgeny Aleksandrov. All rights reserved.

import Foundation
import os.log

public struct Log {

    @available(iOS 10.0, *)
    static let log = OSLog(subsystem: Bundle.main.bundleIdentifier ?? "unknown", category: "App")

    // (off by default, never saved to disk)
    static public func debug(_ message: Any) {
        if #available(iOS 10.0, *) {
            os_log("◾️ %@", log: log, type: .debug, "\(message)")
        } else {
            print("◾️ \(message)")
        }
    }

    // (defaults to memory, saved to disk if there is error or fault)
    static public func info(_ message: Any) {
        if #available(iOS 10.0, *) {
            os_log("🔷 %@", log: log, type: .info, "\(message)")
        } else {
            print("🔷 \(message)")
        }
    }

    // (always saved to disk)
    static public func warning(_ message: Any) {
        if #available(iOS 10.0, *) {
            os_log("🔶 %@", log: log, type: .default, "\(message)")
        } else {
            print("🔶 \(message)")
        }
    }

    // (always saved  to disk)
    static public func error(_ message: Any) {
        if #available(iOS 10.0, *) {
            os_log("❌ %@", log: log, type: .error, "\(message)")
        } else {
            print("❌ \(message)")
        }
    }
}
