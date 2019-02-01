# PhoneGap WebView background color plugin for iOS

by [Eddy Verbruggen](http://www.x-services.nl)

> **Non-PhoneGap Build users, please read this!**
>
> On PhoneGap Build it is not possible to specify the webview background color (hence this plugin), but on local build, you can.
> Just change this line in MainViewController.m to anything you like: theWebView.backgroundColor = [UIColor blackColor];
> For example:     theWebView.backgroundColor = [UIColor clearColor];
>
> That being said, you can still use this plugin to get the same results of course.

## 0. Index

1. [Description](https://github.com/EddyVerbruggen/iOSWebViewColor-PhoneGap-Plugin#1-description)
2. [Installation](https://github.com/EddyVerbruggen/iOSWebViewColor-PhoneGap-Plugin#2-installation)
3. [Usage](https://github.com/EddyVerbruggen/iOSWebViewColor-PhoneGap-Plugin#3-usage)
4. [Testing](https://github.com/EddyVerbruggen/iOSWebViewColor-PhoneGap-Plugin#4-testing)

## 1. Description

This plugin allows you to change the background color of the iOS WebView.
Created because I can't read the contents of the native `<select>` picker (see screenshots below).

* Compatible with PhoneGap 3.0.0 and up.
* Supports all colors, just pass a valid hex value like #FF0000.
* Supports alpha channel, just pass a valid ARGB value like #FF112233 (where FF - alpha channel).
* Compatible with [Cordova Plugman](https://github.com/apache/cordova-plugman).
* Pending official support by [PhoneGap Build](https://build.phonegap.com/plugins).

iOS 7 screenshot - original:

![ScreenShot](https://raw.github.com/EddyVerbruggen/iOSWebViewColor-PhoneGap-Plugin/master/screenshots/original.png)

iOS 7 screenshot - color changed to #FFFFFF (white):

![ScreenShot](https://raw.github.com/EddyVerbruggen/iOSWebViewColor-PhoneGap-Plugin/master/screenshots/changed-white.png)

iOS 7 screenshot - color changed to #FF0000 (red):

![ScreenShot](https://raw.github.com/EddyVerbruggen/iOSWebViewColor-PhoneGap-Plugin/master/screenshots/changed-red.png)

## 2. Installation

```
$ cordova plugin add cordova-plugin-webviewcolor
```

## 3. Usage
You can change the background color immediately after `ondeviceready`, but you may also want to do it by, for instance, a click of a button:
```html
  <button onclick="window.plugins.webviewcolor.change('#FF0000')">change to #FF0000</button>
  <button onclick="window.plugins.webviewcolor.change('#00FF00', function(){alert('color was changed!')})">change to #00FF00</button>
  <button onclick="window.plugins.webviewcolor.change('#880000FF', function(){alert('color was changed!')})">change to semi-transparent blue</button>
```
.change() has three argument
* A valid RGB or ARGB color, formatted like: #FF00FF or #FF112233 (including the #).
* (optional) successcallback, so you know when the color has been changed.
* (optional) errorcallback, but this is never called, since changing the color technically never fails. If the passed color is not valid, the color is simply not changed, but the successcallback is invoked. I didn't find an easy way to change this behaviour, but it shouldn't hurt anyone. I've added the errorcallback argument for possible future compatibility.


## 4. Testing
The background color change can best be seen by allowing overscroll (rubber banding), so when you swipe up and down, the WebView background is shown.

Another possibility is adding a `<select>` or `<input type="date">`.
When clicked, the background color shines through the native picker UI.
