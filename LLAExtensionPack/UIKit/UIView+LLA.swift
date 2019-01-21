//
//  UIView+LLA.swift
//  LLAExtensionPack
//
//  Created by Daisuke T on 2018/12/07.
//  Copyright © 2018 Daisuke T. All rights reserved.
//

import UIKit



extension UIView: LLANamespaceWrapper {}

// MARK: Enum, Const
public extension LLATypeWrapper where T == UIView
{
	fileprivate static let layerNameCorner = "lla_layer_corner"
	fileprivate static let layerNameBorder = "lla_layer_border"
}



// MARK: Layer
public extension LLATypeWrapper where T == UIView
{
	public func setCircled(_ flag: Bool) -> Void
	{
		if flag
		{
			SELF.layer.cornerRadius = SELF.frame.width() * 0.5
			return
		}

		SELF.layer.cornerRadius = 0
	}
}



// MARK: Layer(Corner)
public extension LLATypeWrapper where T == UIView
{
	public func layerCorner() -> CAShapeLayer?
	{
		guard let layer = SELF.layer.mask as? CAShapeLayer else
		{
			return nil
		}

		if layer.name == UIView.LLA.layerNameCorner
		{
			return layer
		}

		return nil
	}

	public func setCorners(_ corners: UIRectCorner, radius: CGFloat) -> Void
	{
		removeCorners()

		if corners.isEmpty
		{
			return
		}


		let cornerRadii = CGSize(width: radius, height: radius)
		let path = UIBezierPath.init(roundedRect: SELF.bounds,
									 byRoundingCorners: corners,
									 cornerRadii: cornerRadii)

		let layer = CAShapeLayer.init()
		layer.path = path.cgPath
		layer.frame = SELF.bounds
		layer.name = UIView.LLA.layerNameCorner

		SELF.layer.mask = layer
		SELF.layer.masksToBounds = true
	}
	
	public func removeCorners() -> Void
	{
		guard let layer = layerCorner() else
		{
			return
		}

		layer.mask = nil
		layer.masksToBounds = false
	}
}



// MARK: Layer(Border)
public extension LLATypeWrapper where T == UIView
{
	public func layerBorder() -> CAShapeLayer?
	{
		guard let res = SELF.layer.LLA.sublayerWithName(UIView.LLA.layerNameBorder) as? CAShapeLayer else
		{
			return nil
		}

		return res
	}

	public func setBorder(_ width: CGFloat, color: UIColor) -> Void
	{
		removeBorder()

		guard let cornerLayer = layerCorner() else
		{
			// corner layer none.
			SELF.layer.borderWidth = width
			SELF.layer.borderColor = color.cgColor
			return
		}

		
		// corner layer exist.
		guard cornerLayer.path != nil else
		{
			return
		}

		
		let layer = CAShapeLayer.init()
		layer.path = cornerLayer.path
		layer.fillColor = UIColor.clear.cgColor
		layer.strokeColor = color.cgColor
		layer.lineWidth = width
		layer.frame = SELF.bounds
		layer.name = UIView.LLA.layerNameBorder
		
		SELF.layer.addSublayer(layer)
	}

	public func removeBorder() -> Void
	{
		guard let layer = layerBorder() else
		{
			// corner layer none.
			SELF.layer.borderWidth = 0
			SELF.layer.borderColor = UIColor.clear.cgColor
			return
		}

		
		// corner layer exist.
		layer.removeFromSuperlayer()
	}
}



// MARK: Gestures
public extension LLATypeWrapper where T == UIView
{
	public func setIsExclusiveTouchRecursive(_ flag: Bool)
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
			subview.LLA.setIsExclusiveTouchRecursive(flag)
		}
	}

	public func removeGestureRecognizers()
	{
		for elm in SELF.gestureRecognizers ?? []
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
	
	public func removeAllSubviews()
	{
		for view in SELF.subviews
		{
			view.removeFromSuperview()
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
