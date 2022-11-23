//
//  UIFontExtension.swift
//  pal2
//
//  Created by Dimitri Dessus on 22/11/2022.
//

import Foundation

extension UIFont {
  private static func registerFont(withName name: String, fileExtension: String) {
    let frameworkBundle = Bundle(for: PalPlugin.self)
    guard let pathForResourceString = frameworkBundle.path(forResource: "\(name)\(fileExtension)", ofType: nil),
             let fontData = NSData(contentsOfFile: pathForResourceString),
             let dataProvider = CGDataProvider(data: fontData)
    else { return }
    
    guard let fontRef = CGFont(dataProvider) else { return }
    var errorRef: Unmanaged<CFError>? = nil
    
    if (CTFontManagerRegisterGraphicsFont(fontRef, &errorRef) == false) {
      debugPrint("Failed to register font - register graphics font failed - this font may have already been registered in the main bundle.")
    }
  }
  
  public static func loadFonts() {
    registerFont(withName: "Inter-Regular", fileExtension: "ttf")
    registerFont(withName: "Inter-Bold", fileExtension: "ttf")
  }
}
