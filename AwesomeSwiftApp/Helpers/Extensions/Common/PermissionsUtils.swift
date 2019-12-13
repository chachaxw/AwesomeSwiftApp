//
//  PermissionsUtils.swift
//  AwesomeSwiftApp
//
//  Created by chacha on 2019/12/13.
//  Copyright © 2019 Chacha. All rights reserved.
//

import AVFoundation
import UIKit

class PermissionsUtils: NSObject {
    static func requireCameraAuthorized(result: @escaping (Bool) -> Void) {
        if AVCaptureDevice.authorizationStatus(for: .video) != .authorized {
            AVCaptureDevice.requestAccess(for: .video) { (success: Bool) in
                DispatchQueue.main.async {
                    result(success)
                }
            }
        } else {
            result(true)
        }
    }
}
