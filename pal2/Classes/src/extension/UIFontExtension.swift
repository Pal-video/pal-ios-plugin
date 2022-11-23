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
    let pathForResourceString = frameworkBundle.path(forResource: name, ofType: fileExtension)
    let fontData = NSData(contentsOfFile: pathForResourceString!)
    let dataProvider = CGDataProvider(data: fontData!)
    let fontRef = CGFont(dataProvider!)
    var errorRef: Unmanaged<CFError>? = nil
    
    if (CTFontManagerRegisterGraphicsFont(fontRef!, &errorRef) == false) {
      print("Error registering font")
    }
  }
  
  public static func loadFonts() {
    registerFont(withName: "Nunito", fileExtension: "ttf")
    registerFont(withName: "NunitoBold", fileExtension: "ttf")
    registerFont(withName: "Inter-Regular", fileExtension: "ttf")
    registerFont(withName: "Inter-Bold", fileExtension: "ttf")
  }
}
