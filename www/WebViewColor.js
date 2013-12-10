function WebViewColor() {
}

WebViewColor.prototype.change = function (hexColor, successCallback, errorCallback) {
  cordova.exec(successCallback, errorCallback, "WebViewColor", "change", [hexColor]);
};

WebViewColor.install = function () {
  if (!window.plugins) {
    window.plugins = {};
  }

  window.plugins.webviewcolor = new WebViewColor();
  return window.plugins.webviewcolor;
};

cordova.addConstructor(WebViewColor.install);