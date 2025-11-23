
//  RtkLivestreamViewFactory.swift
//  Rtk_core_ios

//  Created by Saksham Gupta on 12/07/23.


import Foundation
import AmazonIVSPlayer

class RtkLivestreamViewFactory : NSObject, FlutterPlatformViewFactory {

   func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
       guard let map = args as? [String: Any?],
             let url = map["url"] as? String else {
           return RtkLivestreamView(frame: frame, viewIdentifier: viewId, url: "")
       }

       return RtkLivestreamView(frame: frame, viewIdentifier: viewId, url: url)
   }

   public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
       return FlutterStandardMessageCodec.sharedInstance()
   }
}
