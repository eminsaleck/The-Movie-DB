//
//  ProgressHUDAdapter.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import DLProgressHUD

final class ProgressHUDAdapter: ProgressHUDAdapterProtocol {

    func showHUDWithOnlyText(_ text: String) {
        DLProgressHUD.defaultConfiguration.allowsDynamicTextWidth = true
        DLProgressHUD.defaultConfiguration.shouldDismissAutomatically = true
        DLProgressHUD.defaultConfiguration.hudContentPreferredHeight = 64.0
        DLProgressHUD.show(.textOnly(text))
    }

}
