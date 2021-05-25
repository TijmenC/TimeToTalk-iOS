//
//  Extensions.swift
//  TimeToTalk
//
//  Created by Denny Cox on 18/05/2021.
//

import Foundation

extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

}
