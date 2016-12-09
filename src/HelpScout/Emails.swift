//
//  Emails.swift
//  HelpScout
//
//  Created by Software on 09/12/16.
//  Copyright © 2016 GlobalSTD. All rights reserved.
//
import UIKit
import Foundation

class Emails{
    
   // var image = String()
    var name = String()
    var date = String()
    var asunto = String()
    var descriptionMsj = String()
    var tags = String()
    var mail = MailObj?()
    
    init (name: String, date:String, asunto: String, descriptionMsj: String, tags:String) {
        
         self.name = name
         self.date = date
         self.asunto = asunto
         self.descriptionMsj =  descriptionMsj
         self.tags = tags
    }
    
    
    class MailObj{
        
        var id : String = ""
        var name = String()
        var image = String()
        var date = String()
        var tag = String()
        
        /*
        //inicialiar
        init(speakerJson:JSON){
            //inicializador con la llave correspondiente del json
            self.id = speakerJson["id"].stringValue
            self.name = speakerJson["name"].stringValue
            self.image = speakerJson["image"].stringValue
            self.phrase = speakerJson["phrase"].stringValue
            self.biography = speakerJson["biography"].stringValue

        }
  */
    }

    
}

