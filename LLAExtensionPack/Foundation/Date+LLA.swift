//
//  Date+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2018/12/07.
//  Copyright © 2018 Daisuke T. All rights reserved.
//
		
import Foundation



extension Date: LLANamespaceWrapper {}

// MARK: Components
public extension LLATypeWrapper where T == Date
{
	public func unixTime() -> TimeInterval
	{
		return SELF.timeIntervalSince1970
	}
	
	public func year() -> Int?
	{
		let cal = Calendar(identifier: .gregorian)
		let comps = cal.dateComponents([.year], from: SELF)
		
		return comps.year
	}
	
	public func month() -> Int?
	{
		let cal = Calendar(identifier: .gregorian)
		let comps = cal.dateComponents([.month], from: SELF)
		
		return comps.month
	}
	
	public func weekday() -> Int?
	{
		let cal = Calendar(identifier: .gregorian)
		let comps = cal.dateComponents([.weekday], from: SELF)
		
		return comps.weekday
	}
	
	public func day() -> Int?
	{
		let cal = Calendar(identifier: .gregorian)
		let comps = cal.dateComponents([.day], from: SELF)
		
		return comps.day
	}
	
	public func hour() -> Int?
	{
		let cal = Calendar(identifier: .gregorian)
		let comps = cal.dateComponents([.hour], from: SELF)
		
		return comps.hour
	}
	
	public func minute() -> Int?
	{
		let cal = Calendar(identifier: .gregorian)
		let comps = cal.dateComponents([.minute], from: SELF)
		
		return comps.minute
	}
	
	public func second() -> Int?
	{
		let cal = Calendar(identifier: .gregorian)
		let comps = cal.dateComponents([.second], from: SELF)
		
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
		let comps = cal.dateComponents([.nanosecond], from: SELF)
		
		return comps.nanosecond
	}
}



// MARK: Inspect
public extension LLATypeWrapper where T == Date
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
	


// MARK: Transform
public extension LLATypeWrapper where T == Date
{
	public func lastMonth() -> Date?
	{
		let cal = Calendar(identifier: .gregorian)
		
		return cal.date(byAdding: .month, value: -1, to: cal.startOfDay(for: SELF))
	}

	public func nextMonth() -> Date?
	{
		let cal = Calendar(identifier: .gregorian)
		
		return cal.date(byAdding: .month, value: 1, to: cal.startOfDay(for: SELF))
	}
	
	public func yesterday() -> Date?
	{
		let cal = Calendar(identifier: .gregorian)
		
		return cal.date(byAdding: .day, value: -1, to: cal.startOfDay(for: SELF))
	}
	
	public func tommorow() -> Date?
	{
		let cal = Calendar(identifier: .gregorian)
		
		return cal.date(byAdding: .day, value: 1, to: cal.startOfDay(for: SELF))
	}
	
	public func startOfDay() -> Date?
	{
		let cal = Calendar(identifier: .gregorian)
		let res = cal.startOfDay(for: SELF)

		return res
	}

	public func endOfDay() -> Date?
	{
		let cal = Calendar(identifier: .gregorian)
		
		let date = SELF.LLA.tommorow()
		let dateStart = date!.LLA.startOfDay()
		let res = cal.date(byAdding: .second, value: -1, to: dateStart!)

		return res
	}
	
	public func firstDayOfMonth() -> Date?
	{
		let cal = Calendar(identifier: .gregorian)
		let comps = cal.dateComponents([.year, .month], from: SELF)
		
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
		guard let range = cal.range(of: .day, in: .month, for: SELF) else
		{
			return nil
		}
		
		return range.count
	}
}
