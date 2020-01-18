//
//  CityTableViewCell.swift
//  weatherApp_iOS
//
//  Created by Ankita Jain on 2020-01-17.
//  Copyright © 2020 Ankita Jain. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet weak var cityIcon: UIImageView!
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCity(city:String)
    {
        cityLbl.text = city
        if let weatherUrl = WeatherUrlManager.getCityWeatherUrl(city: city)
        {
            //create a session
            let session = URLSession.shared
            //create a task
            let task = session.dataTask(with: weatherUrl) { (data, response, error) in
                if data != nil{
                    //load the temperature
                    if let weatherData = try? JSON(data!)
                    {
                        print(weatherData)
                        let tempValue = weatherData["main"]["temp"].intValue
                        self.loadIcon(weatherData: weatherData)
                        //UI is in main thread
                        DispatchQueue.main.async {
                            self.tempLbl.text="\(tempValue)"
                        }
                    }
                }
            }
            task.resume()
        }
    }
    func loadIcon(weatherData: JSON)
    {
        let weatherArray = weatherData["weather"].arrayValue
        let iconCode = weatherArray[0]["icon"].stringValue
       if let iconUrl = WeatherUrlManager.getWeatherIconUrl(iconCode: iconCode)
       {
        let session = URLSession.shared
        let task=session.dataTask(with: iconUrl) { (data, response, error) in
            if let iconData = data
            {
                //update the UI
                DispatchQueue.main.async {
                    self.cityIcon.image = UIImage(data: iconData)
                }
            }
        }
        task.resume()
        }
    }

}
