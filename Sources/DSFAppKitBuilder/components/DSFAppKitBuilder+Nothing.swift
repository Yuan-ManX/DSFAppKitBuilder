//
//  DSFAppKitBuilder+Nothing.swift
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

import Foundation
import AppKit

/// An element which is nothing.
public class Nothing: Element {
	public override func view() -> NSView { NothingView() }
}

private class NothingView: NSView {
	override var intrinsicContentSize: NSSize { .zero }
	init() {
		super.init(frame: .zero)

		self.translatesAutoresizingMaskIntoConstraints = false
		let vconstraint = self.widthAnchor.constraint(equalToConstant: 0)
		vconstraint.priority = NSLayoutConstraint.Priority(999)
		let hconstraint = self.heightAnchor.constraint(equalToConstant: 0)
		hconstraint.priority = NSLayoutConstraint.Priority(999)

		self.addConstraint(vconstraint)
		self.addConstraint(hconstraint)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
