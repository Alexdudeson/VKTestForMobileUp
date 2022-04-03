//
//  VKDelegate.swift
//  VKTestApp
//
//  Created by Alexey Yarov on 01.04.2022.
//

import Foundation
import SwiftyVK
import UIKit

class VKDelegate: SwiftyVKDelegate {
    
    init() { VK.setUp(appId: "8115556", delegate: self)
}

    func vkNeedsScopes(for sessionId: String) -> Scopes {
        Scopes([Scopes.email ,
                Scopes.groups,
                Scopes.notifications ,
                Scopes.photos,
                Scopes.wall,
                Scopes.stats,
                Scopes.status,
                Scopes.friends,
                Scopes.video
        ])
    }
    
    func vkNeedToPresent(viewController: VKViewController) {
        if let rootController = UIApplication.shared.keyWindow?.rootViewController {
                        rootController.present(viewController, animated: true)
            
        }
    }
}
