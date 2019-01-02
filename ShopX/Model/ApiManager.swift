//
//  ApiManager.swift
//  ShopX
//
//  Created by Mostafa AbdEl Fatah on 12/30/18.
//  Copyright © 2018 Mostafa AbdEl Fatah. All rights reserved.
//

import Foundation

struct ApiManager {
    
    static var shared: ApiManager = ApiManager.init()
    
    func getData(completion:@escaping (_ menu:Menu?, _ error:String?)-> Void) {
        
        // if file not found return nil data
        guard let path = Bundle.main.path(forResource: "json", ofType: "txt") else {
            return completion(nil,"Error: file not found")
        }
        
        do {
            if let contents = try String(contentsOfFile: path).data(using: .utf8){
                if let menu:Menu = try? JSONDecoder().decode(Menu.self, from: contents ){
                    completion(menu,nil)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
