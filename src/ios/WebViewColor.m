#import "WebViewColor.h"
#import <Cordova/CDV.h>

@implementation WebViewColor

- (void)change:(CDVInvokedUrlCommand*)command {
    NSString *hexColor = [command.arguments objectAtIndex:0];
    UIColor *theColor = [self colorFromHexString:hexColor];
    self.webView.backgroundColor = theColor; 
    self.viewController.view.backgroundColor = theColor;
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}

// Assumes input like "#FF00FF00" (#AARRGGBB)
- (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0x00FF0000) >> 16)/255.0 green:((rgbValue & 0x0000FF00) >> 8)/255.0 blue:(rgbValue & 0x000000FF)/255.0 alpha:((rgbValue & 0xFF000000) >> 24)/255.0];
}

@end
