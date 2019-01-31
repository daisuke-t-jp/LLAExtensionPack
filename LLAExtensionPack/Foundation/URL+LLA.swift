//
//  URL+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2018/12/07.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import Foundation



public extension URL
{
	public var queryMap: [String : String]
	{
		var res: [String : String] = [String : String]()

		guard let query = self.query else
		{
			return res
		}

		let array = query.components(separatedBy: "&")
	
		for elm in array
		{
			let array2 = elm.components(separatedBy: "=")
			guard array2.count >= 2 else
			{
				continue
			}
			
			guard let key = array2[0].removingPercentEncoding else
			{
				continue
			}

			guard let val = array2[1].removingPercentEncoding else
			{
				continue
			}

			res[key] = val
		}

		return res
	}
	
}
