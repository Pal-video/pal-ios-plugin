//
//  UIFontExtension.swift
//  pal2
//
//  Created by Dimitri Dessus on 22/11/2022.
//

import Foundation

extension UIFont {
  private static func registerFontWithFilenameString(filenameString: String) {
    let frameworkBundle = Bundle(for: PalPlugin.self)
    guard let resourcePath = frameworkBundle.path(forResource: "Pal2Ressources", ofType:"bundle"),
          let resourceBundle = Bundle(path: resourcePath)
    else {
      return
    }
    
    guard let pathForResourceString = resourceBundle.path(forResource: filenameString, ofType: nil),
          let fontData = NSData(contentsOfFile: pathForResourceString),
          let dataProvider = CGDataProvider(data: fontData)
    else { return }
    
    guard let fontRef = CGFont(dataProvider) else { return }
    var errorRef: Unmanaged<CFError>? = nil
    
    if (CTFontManagerRegisterGraphicsFont(fontRef, &errorRef) == false) {
      NSLog("Failed to register font - register graphics font failed - this font may have already been registered in the main bundle.")
    }
  }
  
  public static func loadFonts() {
    registerFontWithFilenameString(filenameString: "Inter-Regular.ttf")
    registerFontWithFilenameString(filenameString: "Inter-Bold.ttf")
  }
}
