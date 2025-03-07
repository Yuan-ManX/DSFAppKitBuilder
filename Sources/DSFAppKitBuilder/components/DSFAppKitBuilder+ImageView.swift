//
//  DSFAppKitBuilder+ImageView.swift
//
//  Copyright © 2023 Darren Ford. All rights reserved.
//
//  MIT License
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import AppKit.NSImageView
import DSFValueBinders

/// An image view
///
/// Usage:
///
/// ```swift
/// ImageView(NSImage(named: "MyImage")!)
///    .scaling(.scaleProportionallyUpOrDown)
///    .size(width: 36, height: 36)
/// ```
public class ImageView: Control {
	/// Create an Image view
	/// - Parameters:
	///   - frameStyle: The style to use for the frame, or nil for no frame
	///   - image: the image to initially display
	public init(
		frameStyle: NSImageView.FrameStyle? = nil,
		_ image: NSImage? = nil
	) {
		super.init()
		if let i = image {
			self.imageView.image = i
		}
		if let f = frameStyle {
			self.imageView.imageFrameStyle = f
		}
	}

	deinit {
		self.imageBinder?.deregister(self)
	}

	// Privates
	private let imageView = NSImageView()
	public override func view() -> NSView { return self.imageView }
	private var imageBinder: ValueBinder<NSImage>?
}

// MARK: - Modifiers

public extension ImageView {
	/// The image displayed by the image view.
	func image(_ image: NSImage) -> Self {
		self.imageView.image = image
		return self
	}

	/// The scaling mode applied to make the image fit the frame of the imageview.
	func scaling(_ scaling: NSImageScaling) -> Self {
		self.imageView.imageScaling = scaling
		return self
	}

	/// The style of the imageView frame
	func frameStyle(_ frameStyle: NSImageView.FrameStyle) -> Self {
		self.imageView.imageFrameStyle = frameStyle
		return self
	}
}

// MARK: - Bindings

public extension ImageView {
	/// Bind the image
	func bindImage(_ imageBinder: ValueBinder<NSImage>) -> Self {
		self.imageBinder = imageBinder
		imageBinder.register { [weak self] newValue in
			self?.imageView.image = newValue
		}
		return self
	}
}
