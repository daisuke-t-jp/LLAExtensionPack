//
//  URLSession+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2018/12/07.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import Foundation



public extension URLSession
{
	public func dataTaskSync(_ req: URLRequest,
							 handler: @escaping (Data?, URLResponse?, Error?) -> Void) -> Void
	{
		// create semaphore.
		var semaphore:DispatchSemaphore = DispatchSemaphore(value:0)
		
		// prepare session configuration.
		let config:URLSessionConfiguration = URLSessionConfiguration.default
		
		// prepare session.
		let session:URLSession = URLSession.init(configuration:config)

		
		// start task.
		let task:URLSessionDataTask = session.dataTask(with: req)
		{
			(data, response, error) in

			defer {
				semaphore.signal()
			}

			handler(data, response, error)
		}
		
		task.resume()
		
		_ = semaphore.wait(timeout: DispatchTime.distantFuture)

	}
}

