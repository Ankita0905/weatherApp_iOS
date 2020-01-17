//
//  CityTableViewCell.swift
//  weatherApp_iOS
//
//  Created by Ankita Jain on 2020-01-17.
//  Copyright © 2020 Ankita Jain. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

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
//                        let tempValue = weatherData[
                        print(weatherData)
                    }
                }
            }
            task.resume()
        }
    }

}
