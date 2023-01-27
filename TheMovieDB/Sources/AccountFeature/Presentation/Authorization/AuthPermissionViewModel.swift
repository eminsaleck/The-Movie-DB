//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 27.01.2023.
//

import Foundation

class AuthPermissionViewModel: AuthPermissionViewModelProtocol{
    
    weak var delegate: AuthPermissionViewModelDelegate?
    var authPermissionURL: URL

    init(url: URL) {
      self.authPermissionURL = url
    }

    func signIn() {
        //
    }
    
}
