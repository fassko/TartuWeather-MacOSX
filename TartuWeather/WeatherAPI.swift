//
//  WeatherAPI.swift
//  TartuWeather
//
//  Created by Kristaps Grinbergs on 17/01/16.
//  Copyright © 2016 fassko. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import Fuzi
import Quartz

class WeatherAPI {

  class func getTemperature(completion:(temperature:String) -> Void) {
    Alamofire.request(.GET, "http://meteo.physic.ut.ee/en/frontmain.php?m=2").responseString {
      response in
        if let doc = try? HTMLDocument(string: response.result.value!, encoding: NSUTF8StringEncoding) {
          if let temperature = doc.css("td > b").first {
            print("getTemperature = \(temperature.stringValue)")
            completion(temperature: temperature.stringValue)
          }
        }
    }
  }
  
  class func getWind(completion:(wind:String) -> Void) {
    Alamofire.request(.GET, "http://meteo.physic.ut.ee/en/frontmain.php?m=2").responseString {
      response in
        if let doc = try? HTMLDocument(string: response.result.value!, encoding: NSUTF8StringEncoding) {
          if let wind = doc.css("td > b")[3] {
            print("getTemperature = \(wind.stringValue)")
            completion(wind: wind.stringValue)
          }
        }
    }
  }
  
  class func getMeasuredTime(completion:(time:String) -> Void) {
    
    Alamofire.request(.GET, "http://meteo.physic.ut.ee/en/frontmain.php?m=2").responseString {
      response in
        if let doc = try? HTMLDocument(string: response.result.value!, encoding: NSUTF8StringEncoding) {
        

          if let measuredTime = doc.css("td > small > i").first {
            print("getTemperature = \(measuredTime.stringValue)")
            completion(time: measuredTime.stringValue)
          }
        }
    }
    
  }
  
  class func getData(completion:(temperature:String, wind:String, measuredTime:String) -> Void) {
    Alamofire.request(.GET, "http://meteo.physic.ut.ee/en/frontmain.php?m=2").responseString {
      response in
        if let doc = try? HTMLDocument(string: response.result.value!, encoding: NSUTF8StringEncoding) {
          
          var temperature = ""
          var wind = ""
          var measuredTime = ""
          
          if let val = doc.css("td > b").first {
            print("\(val)")
            temperature = val.stringValue
          }
          
          if let val = doc.css("td > b")[3] {
            print("\(val)")
            wind = val.stringValue
          }
          
          if let val = doc.css("td > small > i").first {
            print("\(val)")
            measuredTime = val.stringValue
          }
          
          completion(temperature: temperature, wind: wind, measuredTime: measuredTime)
        }
    }
  }

  
  class func getCurrentImage(completion:(image:Image) -> Void) {
    Alamofire.request(.GET, "http://meteo.physic.ut.ee/webcam/praegu/normal.jpg").responseImage { response in

      if let image = response.result.value {
        completion(image: image)
      }
    }
  }

}