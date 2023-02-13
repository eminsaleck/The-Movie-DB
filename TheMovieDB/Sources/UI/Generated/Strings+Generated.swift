//
//  Strings+Generated.swift
//
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//


import Foundation

public enum Localized: String, CaseIterable {

  public static var currentLocale = Locale.current

  public func localized() -> String {
    return localizeKey(self.rawValue, Localized.currentLocale)
  }
    
  case accountAlertCancel = "account_alert_cancel" // Cancel
  case accountAlertLogout = "account_alert_logout" // Sign out
  case accountAlertTitle = "account_alert_title"  // Are you sure you want to Sign out?
  case accountFavoriteListTitle = "account_favorite_list_title" // Favorites
  case accountFavoriteWatchListTitle = "account_favorite_watchList_title" // Watch List
  case accountFavoritesCell = "account_favorites_cell" // Favorites
  case accountGreetings = "account_greetings"  // Hi
  case accountLogout = "account_logout"  // Sign out
  case accountTitle = "account_title" // Account
  case accountTitleDetailButton = "account_title_detail_button" // Sign in with TheMovieDB
  case accountTitleLogin = "account_title_login" // Login
  case accountWatchlistCell = "account_watchlist_cell" // Watch List
  case mainTabbar = "main_tabbar" // Today
  case airingTodayTitle = "airing_today_title" // Today on TV
  case commomErrorTitle = "commom_error_title" // Oops!
  case commonEmptyTitle = "common_empty_title" // No shows for Today :(
  case commonErrorRetry = "common_error_retry" // Retry
  case detailsEpisodeGuide = "details_episode_guide" // Episode Guide
  case popularTabbar = "popular_tabbar" // Popular
  case popularTitle = "popular_title" // Popular Movies
  case searchPlaceholder = "search_placeholder" // Search a movie
  case searchResultsRecentSearchsTitle = "search_results_recent_searchs_title" // Recent Searchs
  case searchSectionPopular = "search_section_popular_title" // popular search
  case searchSectionRecentTitle = "search_section_recent_title" // Recently Movies Visited
  case searchTabbar = "search_tabbar" // Search
  case searchTitle = "search_title" // Search Movies

}
