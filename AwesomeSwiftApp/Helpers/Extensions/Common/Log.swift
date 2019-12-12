//
//  Log.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2019/12/12.
//  Copyright © 2019 Chacha. All rights reserved.
//

import Log

extension Formatters {
    static let detailed = Formatter("[%@] %@.%@:%@ %@: %@", [
        .date("yyyy-MM-dd HH:mm:ss.SSS"),
        .file(fullPath: false, fileExtension: false),
        .function,
        .line,
        .level,
        .message
    ])
}

extension Themes {
    static let tomorrowNight = Theme(trace: "#C5C8C6", debug: "#81A2BE", info: "#B5BD68", warning: "#F0C674", error: "#CC6666")
}
