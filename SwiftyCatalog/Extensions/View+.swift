//
//  View+.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-08.
//

import SwiftUI

extension View {
  @inlinable nonisolated public func block() -> some View {
    return self.padding().border(.gray.opacity(0.2))
  }
  @inlinable nonisolated public func wrap() -> some View {
    return self.fixedSize(horizontal: false, vertical: true)
  }
    
}
