//
//  UIView+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2018/12/07.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import UIKit



extension UIView: LLANamespaceWrapper {}

// MARK: Property
public extension LLATypeWrapper where T == UIView
{
	public func x() -> CGFloat
	{
		return SELF.frame.origin.x
	}
	
	public func setX(_ x: CGFloat)
	{
		SELF.frame.origin.x = x
	}

	public func y() -> CGFloat
	{
		return SELF.frame.origin.y
	}
	
	public func setY(_ y: CGFloat)
	{
		SELF.frame.origin.y = y
	}

	public func width() -> CGFloat
	{
		return SELF.frame.size.width
	}
	
	public func setWidth(_ width: CGFloat)
	{
		SELF.frame.size.width = width
	}

	public func height() -> CGFloat
	{
		return SELF.frame.size.height
	}
	
	public func setHeight(_ height: CGFloat)
	{
		SELF.frame.size.height = height
	}
}



// MARK: Layer
public extension LLATypeWrapper where T == UIView
{
	public func setCircled(_ flag: Bool)
	{
		if flag
		{
			SELF.layer.cornerRadius = width() * 0.5
			return
		}

		SELF.layer.cornerRadius = 0
	}

	public func setCornerRadius(_ corners: UIRectCorner,
								radius: CGFloat,
								strokeWidth: CGFloat,
								strokeColor: UIColor)
	{

		if corners.isEmpty
		{
			// no corners.
			SELF.layer.mask = nil
			SELF.layer.masksToBounds = false

			return
		}
	
		// prepare mask path.
		let maskPath:UIBezierPath = UIBezierPath.init(roundedRect: SELF.bounds,
													  byRoundingCorners: corners,
													  cornerRadii: CGSize(width: radius, height: radius))

		// prepare mask layer
		let maskLayer:CAShapeLayer = CAShapeLayer.init()
		maskLayer.path = maskPath.cgPath
		maskLayer.frame = SELF.bounds
		SELF.layer.mask = maskLayer
		SELF.layer.masksToBounds = true
	

		if strokeWidth <= 0
		{
			return
		}

		
		// add stroke.
		let strokeLayer:CAShapeLayer = CAShapeLayer.init()
		strokeLayer.path = maskPath.cgPath
		strokeLayer.fillColor = UIColor.clear.cgColor
		strokeLayer.strokeColor = strokeColor.cgColor
		strokeLayer.lineWidth = strokeWidth
		strokeLayer.frame = SELF.bounds
		
		SELF.layer.addSublayer(strokeLayer)
	}
}



// MARK: Gestures
public extension LLATypeWrapper where T == UIView
{
	public func setExclusiveTouchRecursive(_ flag: Bool)
	{
		for subview in SELF.subviews
		{
			if !subview.isKind(of: UIButton.self)
			{
				continue
			}
			
			let button: UIButton = subview as! UIButton
			button.isExclusiveTouch = flag
			
			// function recursive call.
			subview.LLA.setExclusiveTouchRecursive(flag)
		}

	}

	public func removeGestureRecognizers()
	{
		guard let array = SELF.gestureRecognizers else
		{
			return
		}

		for elm in array
		{
			SELF.removeGestureRecognizer(elm)
		}
	}
}



// MARK: Subviews
public extension LLATypeWrapper where T == UIView
{
	public func removeSubviewOf(tag: Int)
	{
		for view in SELF.subviews
		{
			if view.tag != tag
			{
				continue
			}
			
			view.removeFromSuperview()

			break
		}
	}
}



// MARK: Inspect
public extension LLATypeWrapper where T == UIView
{
	public func isKindOfRecursive(_ clazz: AnyClass) -> UIView?
	{
		for subview in SELF.subviews
		{
			if subview.isKind(of: clazz)
			{
				return subview
			}

			
			// function recursive call.
			let view = subview.LLA.isKindOfRecursive(clazz)
			if view != nil
			{
				return view
			}
		}
	
		return nil
	}

	public func isMemberOfRecursive(_ clazz: AnyClass) -> UIView?
	{
		for subview in SELF.subviews
		{
			if subview.isMember(of: clazz)
			{
				return subview
			}
			
			
			// function recursive call.
			let view = subview.LLA.isMemberOfRecursive(clazz)
			if view != nil
			{
				return view
			}
		}
		
		return nil
	}
	
	public func findFirstResponder() -> UIView?
	{
		if SELF.isFirstResponder
		{
			return SELF
		}

		
		for subview in SELF.subviews
		{
			let view: UIView? = subview.LLA.findFirstResponder()
			if view != nil
			{
				return view
			}
		}
		
		return nil
	}

}
