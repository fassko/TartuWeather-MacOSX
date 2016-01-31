//
//  AppDelegate.swift
//  TartuWeather
//
//  Created by Kristaps Grinbergs on 27/01/16.
//  Copyright © 2016 fassko. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

  func applicationDidFinishLaunching(aNotification: NSNotification) {
    // Insert code here to initialize your application
  }

  @IBAction func refresh(sender: AnyObject) {
    NSNotificationCenter.defaultCenter().postNotificationName("RefreshWeatherData", object: nil)
  }
}

