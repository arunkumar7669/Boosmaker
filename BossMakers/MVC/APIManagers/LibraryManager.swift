////
////  LibraryManager.swift
////  Mandoub Services Platform
////
////  Created by Ashutosh Mishra on 04/04/19.
////  Copyright © 2019 Ashutosh Mishra. All rights reserved.
////
//
//import UIKit
//import CocoaLumberjack
//import Firebase
//import NVActivityIndicatorView
//
//class LibraryManager: NSObject {
//
//    static let shared = LibraryManager()
//    private override init() {}
//    
//    private var window: UIWindow?
//    private var options: [UIApplication.LaunchOptionsKey: Any]?
//    private var application: UIApplication?
//    
//    func setupLibs(with window: UIWindow? = nil, options: [UIApplication.LaunchOptionsKey: Any]? = nil, application: UIApplication? = nil) {
//        self.window = window
//        self.options = options
//        self.application = application
//        self.window?.backgroundColor = UIColor.white
//        
//        let libraryManager = LibraryManager.shared
//        libraryManager.setupCocoaLumberjack()
//        libraryManager.setupKeyboardManager()
//        libraryManager.setupActivityView()
//        
//        self.firebaseSetup()
//        
//        self.otherIntialSetup()
//        
//        self.setupViewControllers()
//        
//        self.setNavigationBar()
//        
//    }
//    
//// for storyBorad setup
//    
//    func setupViewControllers() {
////        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
////
////        let mainViewController   = mainStoryboard.instantiateViewController(withIdentifier: "categoryList")
////        let drawerViewController = mainStoryboard.instantiateViewController(withIdentifier: "sideDrawer")
//        //        drawerViewController.navigationProtocol = drawerViewController
//        
//        
////        if !Defaults().language.isEmpty {
////            if Defaults().language == "ar"{
////                UIView.appearance().semanticContentAttribute = .forceRightToLeft
////                
////            } else {
////                UIView.appearance().semanticContentAttribute = .forceLeftToRight
////                
////            }
////        } else {
////            UIView.appearance().semanticContentAttribute = .forceLeftToRight
////            let selectLanguage = SelectLanguageVC(nibName: "SelectLanguageVC", bundle: nil)
////            self.window?.rootViewController = selectLanguage
////            window?.makeKeyAndVisible()
////        }
//    
////        drawerController.screenEdgePanGestureEnabled = false
////        drawerController.mainViewController = mainViewController
//        //        drawerController.mainViewController = UINavigationController(
//        //            rootViewController: mainViewController ?? UIViewController()
////        //        )
////        drawerController.drawerViewController = drawerViewController
////
////        window = UIWindow(frame: UIScreen.main.bounds)
////        window?.rootViewController = drawerController
////        window?.makeKeyAndVisible()
//    }
//    
////    for firebase setup
//    func firebaseSetup() {
//        if Constants.environment == .userApp {
//            let filePath = Bundle.main.path(forResource: "GoogleService-Info-User", ofType: "plist")
//            guard let fileopts = FirebaseOptions(contentsOfFile: filePath!)
//                else { assert(false, "Couldn't load config file")
//                    return
//            }
//            FirebaseApp.configure(options: fileopts)
//        } else {
//            let filePath = Bundle.main.path(forResource: "GoogleService-Info-Vendor", ofType: "plist")
//            guard let fileopts = FirebaseOptions(contentsOfFile: filePath!)
//                else { assert(false, "Couldn't load config file")
//                    return
//            }
//            FirebaseApp.configure(options: fileopts)
//        }
//    }
//    
////   App default setup
//    func otherIntialSetup() {
//        
////        tabbar setup
////        UITabBarItem.appearance().setTitleTextAttributes(
////            [NSAttributedString.Key.font: UIFont.customBookFont(size: 12)],
////            for: .normal)
////
////        UITabBarItem.appearance().setTitleTextAttributes(
////            [NSAttributedString.Key.font: UIFont.customBoldFont(size: 12)],
////            for: .selected)
//
//        
//       
////        let titleFontAll : UIFont = UIFont(name: "American Typewriter", size: 13.0)!
////        
////        let attributesNormal = [
////            NSForegroundColorAttributeName : colorNormal,
////            NSFontAttributeName : titleFontAll
////        ]
////        
////        let attributesSelected = [
////            NSForegroundColorAttributeName : colorSelected,
////            NSFontAttributeName : titleFontAll
////        ]
////        
////        UITabBarItem.appearance().setTitleTextAttributes(attributesNormal, forState: .Normal)
////        UITabBarItem.appearance().setTitleTextAttributes(attributesSelected, forState: .Selected)
////        
//        
//        //        self.application?.statusBarStyle = .default
//        
//        UITextField.appearance().tintColor = .black
//        
//        let navigationBarAppearace = UINavigationBar.appearance()
//        navigationBarAppearace.tintColor = UIColor.white
//        navigationBarAppearace.barTintColor = UIColor.white
//        // change navigation item title color
//        navigationBarAppearace.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//        
////        let barButtonItemAppearance = UIBarButtonItem.appearance()
////        barButtonItemAppearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)
////        barButtonItemAppearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .selected)
////        barButtonItemAppearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .highlighted)
//        
//    }
////    for activity Controller
//    
//    func setupActivityView() {
//        NVActivityIndicatorView.DEFAULT_TYPE = .ballClipRotateMultiple
//        NVActivityIndicatorView.DEFAULT_COLOR = UIColor.lightGray
//    }
//    
//    func setupCocoaLumberjack() {
//        DDLog.add(DDTTYLogger.sharedInstance) // TTY = Xcode console
//        //        DDLog.add(DDASLLogger.sharedInstance) // ASL = Apple System Logs
//        
//        let fileLogger: DDFileLogger = DDFileLogger() // File Logger
//        fileLogger.rollingFrequency = TimeInterval(60 * 60 * 24)  // 24 hours
//        fileLogger.logFileManager.maximumNumberOfLogFiles = 7
//        DDLog.add(fileLogger)
//    }
////    for keyboard manager
//    func setupKeyboardManager() {
//        IQKeyboardManager.shared.enable = true
//    }
//    func disableKeyboardManager() {
//        IQKeyboardManager.shared.enable = false
//    }
//    
//    func setNavigationBar() {
//        let navigationBarAppearace = UINavigationBar.appearance()
//        navigationBarAppearace.tintColor = Constants.appThemeColor
//        navigationBarAppearace.barTintColor = UIColor.white
//        navigationBarAppearace.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
//    }
//}
