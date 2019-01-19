//
//  UIControl+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2018/12/07.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import UIKit



public extension LLATypeWrapper where T == UIControl
{
	public func removeAllTarget() -> Void
	{
		SELF.removeTarget(nil, action: nil, for: .allEvents)
	}
}
