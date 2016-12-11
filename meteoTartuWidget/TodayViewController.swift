//
//  TodayViewController.swift
//  meteoTartuWidget
//
//  Created by Kristaps Grinbergs on 31/01/16.
//  Copyright © 2016 fassko. All rights reserved.
//

import Cocoa
import NotificationCenter

import TartuWeatherProvider

class TodayViewController: NSViewController, NCWidgetProviding {

  @IBOutlet weak var temperatureLabel: NSTextField!
  @IBOutlet weak var windLabel: NSTextField!
  @IBOutlet weak var measuredTimeLabel: NSTextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    updateData()
    
  }

    override var nibName: String? {
        return "TodayViewController"
    }

    func widgetPerformUpdate(completionHandler: @escaping ((NCUpdateResult) -> Void)) {
        // Update your data and prepare for a snapshot. Call completion handler when you are done
        // with NoData if nothing has changed or NewData if there is new data since the last
        // time we called you
      updateData()
    }
  
    private func updateData() {
      TartuWeatherProvider.getWeatherData(completion: {data, error in
        guard let temperature = data?["temperature"], let wind = data?["wind"], let measuredTime = data?["measuredTime"] else {
          return
        }
      
        self.temperatureLabel.stringValue = temperature
        self.windLabel.stringValue = wind
        self.measuredTimeLabel.stringValue = measuredTime
      })
    }

}
