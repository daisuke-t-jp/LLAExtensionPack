//
//  Date+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2018/12/07.
//  Copyright © 2018 Daisuke T. All rights reserved.
//
		
import Foundation



// MARK: - Components
public extension Date {

	public var unixTime: TimeInterval {
		return timeIntervalSince1970
	}
	
	public var year: Int? {
		let cal = Calendar(identifier: .gregorian)
		let comps = cal.dateComponents([.year], from: self)
		
		return comps.year
	}
	
	public var month: Int? {
		let cal = Calendar(identifier: .gregorian)
		let comps = cal.dateComponents([.month], from: self)
		
		return comps.month
	}
	
	public var weekday: Int? {
		let cal = Calendar(identifier: .gregorian)
		let comps = cal.dateComponents([.weekday], from: self)
		
		return comps.weekday
	}
	
	public var day: Int? {
		let cal = Calendar(identifier: .gregorian)
		let comps = cal.dateComponents([.day], from: self)
		
		return comps.day
	}
	
	public var hour: Int? {
		let cal = Calendar(identifier: .gregorian)
		let comps = cal.dateComponents([.hour], from: self)
		
		return comps.hour
	}
	
	public var minute: Int? {
		let cal = Calendar(identifier: .gregorian)
		let comps = cal.dateComponents([.minute], from: self)
		
		return comps.minute
	}
	
	public var second: Int? {
		let cal = Calendar(identifier: .gregorian)
		let comps = cal.dateComponents([.second], from: self)
		
		return comps.second
	}
	
	public var millisecond: Int? {
		return nanosecond! / 1000000
	}

	public var microsecond: Int? {
		return nanosecond! / 1000
	}

	public var nanosecond: Int? {
		let cal = Calendar(identifier: .gregorian)
		let comps = cal.dateComponents([.nanosecond], from: self)
		
		return comps.nanosecond
	}
}



// MARK: - Inspect
public extension Date {

	public var isLeapYear: Bool {
		guard let y = year else {
			return false
		}
		
		let res = ((y % 4 == 0) && (y % 100 != 0) || (y % 400 == 0))
		return res
	}
}
	


// MARK: - Transform
public extension Date {
	
	public var lastMonth: Date? {
		let cal = Calendar(identifier: .gregorian)
		
		return cal.date(byAdding: .month, value: -1, to: cal.startOfDay(for: self))
	}

	public var nextMonth: Date? {
		let cal = Calendar(identifier: .gregorian)
		
		return cal.date(byAdding: .month, value: 1, to: cal.startOfDay(for: self))
	}
	
	public var yesterday: Date? {
		let cal = Calendar(identifier: .gregorian)
		
		return cal.date(byAdding: .day, value: -1, to: cal.startOfDay(for: self))
	}
	
	public var tommorow: Date? {
		let cal = Calendar(identifier: .gregorian)
		
		return cal.date(byAdding: .day, value: 1, to: cal.startOfDay(for: self))
	}
	
	public var startOfDay: Date? {
		let cal = Calendar(identifier: .gregorian)
		let res = cal.startOfDay(for: self)

		return res
	}

	public var endOfDay: Date? {
		let cal = Calendar(identifier: .gregorian)
		
		let date = tommorow
		let dateStart = date!.startOfDay
		let res = cal.date(byAdding: .second, value: -1, to: dateStart!)

		return res
	}
	
	public var firstDayOfMonth: Date? {
		let cal = Calendar(identifier: .gregorian)
		let comps = cal.dateComponents([.year, .month], from: self)
		
		return cal.date(from: comps)
	}
	
	public var endDayOfMonth: Date? {
		let cal = Calendar(identifier: .gregorian)
		let comps = DateComponents(month: 1, day: -1)
		
		return cal.date(byAdding: comps, to: firstDayOfMonth!)
	}

	public var daysOfMonth: Int? {
		let cal = Calendar(identifier: .gregorian)
		guard let range = cal.range(of: .day, in: .month, for: self) else {
			return nil
		}
		
		return range.count
	}
}
