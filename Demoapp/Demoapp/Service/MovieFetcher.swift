//
//  MovieFetcher.swift
//  Demoapp
//
//  Created by vivek bajirao deshmukh on 17/04/20.
//  Copyright © 2020 vivek bajirao deshmukh. All rights reserved.
//

import Foundation

public class MovieFetcher: ObservableObject {
     @Published var rows = [Rows]()
    
    init(){
        load()
    }
    
    
    // API Call
    func load() {
        guard let url = URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json") else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in

            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }

            guard let values = String(data: dataResponse, encoding: .ascii) else { return }
            guard let jsonData = values.data(using: .utf8) else { return }

            do {

                let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: Any]
                  print(json)
//                let dataDict : [String: Any] = [:]
                if let rows = json["rows"] as? [[String: Any]] {
                    for dataDict : [String: Any] in rows{
                        let rows = Rows(dictionary: dataDict as NSDictionary)
                        rows?.imageHref = dataDict["imageHref"] as? String
                        rows?.description = dataDict["description"] as? String
                        rows?.title = dataDict["title"] as? String
                    }
                }
            }catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()


    }
    
    
}
