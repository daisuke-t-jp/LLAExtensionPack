//
//  Date+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2018/12/07.
//  Copyright © 2018 Daisuke T. All rights reserved.
//
		
import Foundation



// MARK: - Components
public extension Date
{
	public func unixTime() -> TimeInterval
	{
		return timeIntervalSince1970
	}
	
	public func year() -> Int?
	{
		let cal = Calendar(identifier: .gregorian)
		let comps = cal.dateComponents([.year], from: self)
		
		return comps.year
	}
	
	public func month() -> Int?
	{
		let cal = Calendar(identifier: .gregorian)
		let comps = cal.dateComponents([.month], from: self)
		
		return comps.month
	}
	
	public func weekday() -> Int?
	{
		let cal = Calendar(identifier: .gregorian)
		let comps = cal.dateComponents([.weekday], from: self)
		
		return comps.weekday
	}
	
	public func day() -> Int?
	{
		let cal = Calendar(identifier: .gregorian)
		let comps = cal.dateComponents([.day], from: self)
		
		return comps.day
	}
	
	public func hour() -> Int?
	{
		let cal = Calendar(identifier: .gregorian)
		let comps = cal.dateComponents([.hour], from: self)
		
		return comps.hour
	}
	
	public func minute() -> Int?
	{
		let cal = Calendar(identifier: .gregorian)
		let comps = cal.dateComponents([.minute], from: self)
		
		return comps.minute
	}
	
	public func second() -> Int?
	{
		let cal = Calendar(identifier: .gregorian)
		let comps = cal.dateComponents([.second], from: self)
		
		return comps.second
	}
	
	public func millisecond() -> Int?
	{
		return nanosecond()! / 1000000
	}

	public func microsecond() -> Int?
	{
		return nanosecond()! / 1000
	}

	public func nanosecond() -> Int?
	{
		let cal = Calendar(identifier: .gregorian)
		let comps = cal.dateComponents([.nanosecond], from: self)
		
		return comps.nanosecond
	}
}



// MARK: - Inspect
public extension Date
{
	public func isLeapYear() -> Bool
	{
		guard let y = year() else
		{
			return false
		}
		
		let res = ((y % 4 == 0) && (y % 100 != 0) || (y % 400 == 0))
		return res
	}
}
	


// MARK: - Transform
public extension Date
{
	public func lastMonth() -> Date?
	{
		let cal = Calendar(identifier: .gregorian)
		
		return cal.date(byAdding: .month, value: -1, to: cal.startOfDay(for: self))
	}

	public func nextMonth() -> Date?
	{
		let cal = Calendar(identifier: .gregorian)
		
		return cal.date(byAdding: .month, value: 1, to: cal.startOfDay(for: self))
	}
	
	public func yesterday() -> Date?
	{
		let cal = Calendar(identifier: .gregorian)
		
		return cal.date(byAdding: .day, value: -1, to: cal.startOfDay(for: self))
	}
	
	public func tommorow() -> Date?
	{
		let cal = Calendar(identifier: .gregorian)
		
		return cal.date(byAdding: .day, value: 1, to: cal.startOfDay(for: self))
	}
	
	public func startOfDay() -> Date?
	{
		let cal = Calendar(identifier: .gregorian)
		let res = cal.startOfDay(for: self)

		return res
	}

	public func endOfDay() -> Date?
	{
		let cal = Calendar(identifier: .gregorian)
		
		let date = tommorow()
		let dateStart = date!.startOfDay()
		let res = cal.date(byAdding: .second, value: -1, to: dateStart!)

		return res
	}
	
	public func firstDayOfMonth() -> Date?
	{
		let cal = Calendar(identifier: .gregorian)
		let comps = cal.dateComponents([.year, .month], from: self)
		
		return cal.date(from: comps)
	}
	
	public func endDayOfMonth() -> Date?
	{
		let cal = Calendar(identifier: .gregorian)
		let comps = DateComponents(month: 1, day: -1)
		
		return cal.date(byAdding: comps, to: firstDayOfMonth()!)
	}

	public func daysOfMonth() -> Int?
	{
		let cal = Calendar(identifier: .gregorian)
		guard let range = cal.range(of: .day, in: .month, for: self) else
		{
			return nil
		}
		
		return range.count
	}
}
