//
//  contenthandleplugin.h
//  HelloCordova
//
//  Created by Aviraj L Patel on 08/11/15.
//
//

#import <Cordova/CDV.h>

@interface ContentHandlePlugin : CDVPlugin

// This will return the file contents in a JSON object via the getFileContents utility method
- (void) cancel:(CDVInvokedUrlCommand *)command;

@end