//
//  DSFAppKitBuilder+CheckBox.swift
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

import AppKit.NSButton

/// A checkbox control
///
/// Usage:
///
/// ```swift
/// CheckBox("Notify using system notification") { [weak self] newState in
///    // button action code
/// }
/// ```
public class CheckBox<CheckboxType: NSButton>: Button<CheckboxType> {
	/// Create a CheckBox
	/// - Parameters:
	///   - title: The title to display
	///   - allowMixedState: Does the button allow mixed state?
	///   - action: The action block to perform when the button is activated
	public init(
		_ title: String = "Checkbox",
		allowMixedState: Bool = false,
		_ action: ButtonAction? = nil
	) {
		super.init(
			title: title,
			type: .switch,
			allowMixedState: allowMixedState,
			action
		)
	}
}
