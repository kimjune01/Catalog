//
//  FontView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-08.
//

import SwiftUI

struct SystemFontView: View {
  var body: some View {
    ScrollView{
      VStack(alignment: .leading, spacing: 20) {
        
        Text("Utility variants: ")
        ScrollView(.horizontal) {
          HStack (spacing: 20) {
            Text("largeTitle").font(.largeTitle)
              .block()
            Text("title").font(.title)
              .block()
            Text("title2").font(.title2)
              .block()
            Text("title3").font(.title3)
              .block()
            Text("headline").font(.headline)
              .block()
            Text("subheadline").font(.subheadline)
              .block()
            Text("body").font(.body)
              .block()
            Text("callout").font(.callout)
              .block()
            Text("footnote").font(.footnote)
              .block()
            Text("caption").font(.caption)
              .block()
            Text("caption2").font(.caption2)
              .block()
          }
        }
        
        Text("Weight: ")
        ScrollView(.horizontal) {
          HStack (spacing: 20) {
            Text("ultralight")
              .font(.system(size: 16, weight: .ultraLight))
              .block()
            Text("thin")
              .font(.system(size: 16, weight: .thin))
              .block()
            Text("light")
              .font(.system(size: 16, weight: .light))
              .block()
            Text("regular")
              .font(.system(size: 16, weight: .regular))
              .block()
            Text("medium")
              .font(.system(size: 16, weight: .medium))
              .block()
            Text("semibold")
              .font(.system(size: 16, weight: .semibold))
              .block()
            Text("bold")
              .font(.system(size: 16, weight: .bold))
              .block()
            Text("heavy")
              .font(.system(size: 16, weight: .heavy))
              .block()
            Text("black")
              .font(.system(size: 16, weight: .black))
              .block()
          }
        }
        
        Text("Size: ")
        ScrollView(.horizontal) {
          HStack (spacing: 20) {
            Text("size 12")
              .font(.system(size: 12))
              .block()
            Text("size 14")
              .font(.system(size: 14))
              .block()
            Text("size 16")
              .font(.system(size: 16))
              .block()
            Text("size 18")
              .font(.system(size: 18))
              .block()
            Text("size 20")
              .font(.system(size: 20))
              .block()
          }
        }
        
        Text("Design: ")
        ScrollView(.horizontal) {
          HStack (spacing: 20) {
            Text("monospaced")
              .font(.system(size: 16, design:.monospaced))
              .block()
            Text("rounded")
              .font(.system(size: 16, design:.rounded))
              .block()
            Text("serif")
              .font(.system(size: 16, design:.serif))
              .block()
            Text("none")
              .font(.system(size: 16, design:.none))
              .block()
          }
        }
        
        Text("Styling: ")
        ScrollView(.horizontal) {
          HStack (spacing: 20) {
            Text("bold")
              .bold()
              .block()
            Text("italic")
              .italic()
              .block()
            Text("underline")
              .underline()
              .block()
            Text("underline dot")
              .underline(pattern: .dot)
              .block()
            Text("underline dash")
              .underline(pattern: .dash)
              .block()
            Text("underline red")
              .underline(color: .red)
              .block()
            Text("strikethrough")
              .strikethrough()
              .block()
            Text("strikethrough dot")
              .strikethrough(pattern: .dot)
              .block()
            Text("strikethrough dash")
              .strikethrough(pattern: .dash)
              .block()
            Text("strikethrough red")
              .strikethrough(color: .red)
              .block()
            Text("monospaced")
              .monospaced()
              .block()
            Text("monospacedDigit 123")
              .monospacedDigit()
              .block()
          }
        }
        
        Text("Font Width: ")
        ScrollView(.horizontal) {
          HStack (spacing: 20) {
            Text("standard")
              .fontWidth(.standard)
              .block()
            Text("compressed")
              .fontWidth(.compressed)
              .block()
            Text("condensed")
              .fontWidth(.condensed)
              .block()
            Text("expanded")
              .fontWidth(.expanded)
              .block()
          }
        }
        
        Text("Foreground Styles: ")
        ScrollView(.horizontal) {
          HStack (spacing: 20) {
            Text("secondary")
              .foregroundStyle(.secondary)
              .block()
            Text("tertiary")
              .foregroundStyle(.tertiary)
              .block()
            Text("link")
              .foregroundStyle(.link)
              .block()
            Text("placeholder")
              .foregroundStyle(.placeholder)
              .block()
            Text("fill")
              .foregroundStyle(.fill)
              .block()
            Text("blue")
              .foregroundStyle(.blue)
              .block()
            Text("red")
              .foregroundStyle(.red)
              .block()
            Text("yellow")
              .foregroundStyle(.yellow)
              .block()
            Text("orange")
              .foregroundStyle(.orange)
              .block()
            Text("cyan")
              .foregroundStyle(.cyan)
              .block()
            Text("brown")
              .foregroundStyle(.brown)
              .block()
            Text("purple")
              .foregroundStyle(.purple)
              .block()
            Text("green")
              .foregroundStyle(.green)
              .block()
            Text("gray")
              .foregroundStyle(.gray)
              .block()
            Text("indigo")
              .foregroundStyle(.indigo)
              .block()
            Text("mint")
              .foregroundStyle(.mint)
              .block()
            Text("pink")
              .foregroundStyle(.pink)
              .block()
            Text("teal")
              .foregroundStyle(.teal)
              .block()
          }
        }
      }
    }.padding()
  }
}

#Preview {
  SystemFontView()
}
