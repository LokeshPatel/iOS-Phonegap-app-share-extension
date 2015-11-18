//
//  Contenthandleplugin.m
//  HelloCordova
//
//  Created by Aviraj L Patel on 08/11/15.
//
//

#import "ContentHandlePlugin.h"
#import "ShareViewController.h"
@implementation ContentHandlePlugin

- (void) cancel:(CDVInvokedUrlCommand *)command
{
    // Create an instance of CDVPluginResult, with an OK status code.
    
    CDVPluginResult *pluginResult = [ CDVPluginResult resultWithStatus : CDVCommandStatus_OK ];
  
    [ShareViewController cancelShareView:[ShareViewController getShareVaribleHandle]];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    
}

@end