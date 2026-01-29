//
//  AlertTypes.swift
//  GlassCast
//
//  Created by Chandra Kiran Reddy Yeduguri on 27/01/26.
//

enum AlertTypes {
    case error
    case info
    case warning
    
    var name: String {
        switch self {
        case .error:
            "Error"
        case .info:
            "Info"
        case .warning:
            "Warning"
        }
    }
}
