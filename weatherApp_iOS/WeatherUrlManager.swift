//
//  WeatherUrlManager.swift
//  weatherApp_iOS
//
//  Created by Ankita Jain on 2020-01-17.
//  Copyright © 2020 Ankita Jain. All rights reserved.
//

import Foundation

class WeatherUrlManager
{
    static func getCityWeatherUrl(city:String)->URL?
    {
        let city = city.replacingOccurrences(of: " ", with: "%20")
        let urlString = "http://api.openweathermap.org/data/2.5/weather?q=\(city)&units=metric&APPID=e374da6d1dfad92ef07f72798d1e50a1"
        return URL(string: urlString)
    }
   
    static func getWeatherIconUrl(iconCode:String)->URL?
    {
        let urlString = "https://openweathermap.org/img/w/\(iconCode).png"
        return URL(string: urlString)
    }
   
    static func getForecastWeatherUrl(city:String)->URL?
    {
        let urlString="http://api.openweathermap.org/data/2.5/forecast?q=\(city)&units=metric&APPID=e374da6d1dfad92ef07f72798d1e50a1"
        return URL(string: urlString)
    }
}
