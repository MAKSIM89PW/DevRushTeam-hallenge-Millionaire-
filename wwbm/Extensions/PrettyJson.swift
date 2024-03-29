//
//  PrettyJson.swift
//  wwbm
//
//  Created by dsm 5e on 02.03.2024.
//

import Foundation

extension Data {
    /// Выводит красивый вид для `Data` в тексте
    var prettyJson: String {
        if let object = try? JSONSerialization.jsonObject(with: self, options: [.fragmentsAllowed]),
           let jsonData = try? JSONSerialization.data(withJSONObject: object, options: .prettyPrinted),
           let json = String(data: jsonData, encoding: .utf8) {
            return json
        } else {
            return ""
        }
    }
    
    /// Добавляем поля в `body`
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}

extension Data {
    var prettyPrintedJSONString: NSString? {
        guard let jsonObject = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: jsonObject,
                                                       options: [.prettyPrinted]),
              let prettyJSON = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else {
                  return nil
               }

        return prettyJSON
    }
}
