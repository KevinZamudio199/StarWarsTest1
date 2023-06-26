//
//  Extensions.swift
//  StarWarsTest
//
//  Created by Kevin Velazquez Zamudio on 22/06/23.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    func DownloadImgFromURL(url : String) {
        let url = URL(string: url)
        
        image = nil
        
        if let imageFormCache = imageCache.object(forKey: url as AnyObject) as? UIImage {
            self.image = imageFormCache
           
            return
        }
        
        if url != nil {
            let task = URLSession.shared.dataTask(with: url!) {responseData,response,error in
                if error == nil {
                    if let data = responseData {
                        
                        DispatchQueue.main.async {
                            
                            let imageToCache = UIImage(data: data)
                            if imageToCache != nil {
                                imageCache.setObject(imageToCache!, forKey: url as AnyObject)
                                self.image = imageToCache
                                
                            }
                                                      
                        }
                        
                    }else {
                        print("no data")
                    }
                }else{
                    print("error")
                }
            }
            task.resume()
        }
    }
}

