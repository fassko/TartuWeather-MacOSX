//
//  ViewController.swift
//  TartuWeather
//
//  Created by Kristaps Grinbergs on 27/01/16.
//  Copyright © 2016 fassko. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

  @IBOutlet weak var temperatureLabel: NSTextField!
  @IBOutlet weak var windLabel: NSTextField!
  @IBOutlet weak var measuredTimeLabel: NSTextField!
  @IBOutlet weak var currentImage: NSImageView!

  override func viewDidLoad() {
    super.viewDidLoad()

    updateWeather()
  }

  override var representedObject: AnyObject? {
    didSet {
    // Update the view, if already loaded.
    }
  }
  
  func updateWeather() {
    WeatherAPI.getData({
      (temperature, wind, measuredTime) in
        self.temperatureLabel.stringValue = temperature
        self.windLabel.stringValue = wind
        self.measuredTimeLabel.stringValue = measuredTime
    })
    
    WeatherAPI.getCurrentImage({
      (image) in
        self.currentImage.image = image
    })

  }
  
  
  
  
  @IBAction func refresh(sender: AnyObject) {
    updateWeather()
  }


}

