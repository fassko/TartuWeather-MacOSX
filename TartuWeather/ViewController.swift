//
//  ViewController.swift
//  TartuWeather
//
//  Created by Kristaps Grinbergs on 27/01/16.
//  Copyright © 2016 fassko. All rights reserved.
//

import Cocoa

import TartuWeatherProvider

class ViewController: NSViewController {

  @IBOutlet weak var temperatureLabel: NSTextField!
  @IBOutlet weak var windLabel: NSTextField!
  @IBOutlet weak var measuredTimeLabel: NSTextField!
  @IBOutlet weak var currentImage: NSImageView!

  override func viewDidLoad() {
    super.viewDidLoad()

    updateWeather()
    
    NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateWeather), name: NSNotification.Name(rawValue: "RefreshWeatherData"), object: nil)
  }

  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }
  
  func updateWeather() {
  
    TartuWeatherProvider.getWeatherData(completion: {data, error in

      guard let temperature = data?["temperature"], let wind = data?["wind"], let measuredTime = data?["measuredTime"] else {
        return
      }
    
      self.temperatureLabel.stringValue = temperature
      self.windLabel.stringValue = wind
      self.measuredTimeLabel.stringValue = measuredTime
    })
  
    TartuWeatherProvider.getCurrentImage(completion: {image in
      self.currentImage.image = image
    })
    
  }
  
  @IBAction func refreshData(_ sender: Any) {
    updateWeather()
  }

}

