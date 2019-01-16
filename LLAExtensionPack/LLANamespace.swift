//
//  LLANamespace.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2018/12/07.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import Foundation



public protocol LLANamespaceWrapper {
	associatedtype T
	var LLA: T { get }
	static var LLA: T.Type { get }
}

extension LLANamespaceWrapper {
	public var LLA: LLATypeWrapper<Self> {
		return LLATypeWrapper(value: self)
	}
	
	public static var LLA: LLATypeWrapper<Self>.Type {
		return LLATypeWrapper.self
	}
}

public struct LLATypeWrapper<T> {
	var SELF: T
	init(value: T) {
		self.SELF = value
	}
}

