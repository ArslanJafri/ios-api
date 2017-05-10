<a href="https://www.wrld3d.com/">
    <img src="https://cdn2.wrld3d.com/wp-content/uploads/2017/04/WRLD_Blue.png"  align="right" height="80px" />
</a>

# WRLD iOS SDK
A framework for displaying beautiful, interactive 3D maps on iOS devices.

This repository contains source code for the Objective-C framework alongside a demo app, intended for developers contributing to the library itself.

If you want to use the framework in your iOS application, then see our [documentation](https://docs.wrld3d.com/ios/latest/docs/api/) for guidance on how to add WRLD 3D maps to your iOS app. Our [example github repository](https://github.com/wrld3d/ios-api-example) contains example apps to help get you started.

The framework is available on [CocoaPods](https://cocoapods.org/pods/wrld).

## Status
This framework is currently in alpha, and is undergoing active development. We plan to add further features in the near future. Got something you want to do in your app? Let us know via the [issues](https://github.com/wrld3d/ios-api/issues) page.

## Building the SDK

### Requirements
* Latest Xcode (Tested 7.x and 8.x)
* [CocoaPods](https://guides.cocoapods.org/using/getting-started.html)

### Building
This section will walk you through the process of getting up and running quickly.

1.  Install CocoaPods as described in the [CocoaPods guide](https://guides.cocoapods.org/using/getting-started.html#getting-started).
2.  Clone this repo: `git clone https://github.com/wrld3d/ios-api.git`
3.  Install dependencies by running `pod install` from the root of the repo.
4.  Obtain a [WRLD API key](https://www.wrld3d.com/developers/apikeys) and place it in the [Info.plist](https://github.com/wrld3d/ios-api/blob/master/ApiDemo/Info.plist#L49) file.
5.  Open, build, and run **ios-sdk.xcworkspace** in Xcode.

**Note:** Run `pod update` followed by `pod install` to update the pod to the latest version if you have already setup your pod as above.

### WRLD API Key 
In order to use the WRLD iOS API, you must sign up for a free developer account at https://www.wrld3d.com/developers. After signing up, you'll be able to create an [API key](https://www.wrld3d.com/developers/apikeys) for your apps. 

After signing up for a developer account and creating an API key, add it to the demo app [plist file](https://github.com/wrld3d/ios-api/blob/master/ApiDemo/Info.plist#L49) as described [above](#getting-started).

If you are creating a new app, or integrating WRLD 3D Maps into an existing app, the API key should be present in the main bundle info dictionary for the key "WrldApiKey" at the time the [WRLDMapView](https://github.com/wrld3d/ios-api/blob/master/src/private/WRLDMapView.mm) is created.

## Further information
See our [api samples](https://github.com/wrld3d/ios-api-example) for complete applications using the SDK, and our [documentation](https://docs.wrld3d.com/ios/latest/docs/api/) for additional information.

Questions, comments, or problems? All feedback is welcome -- just [create an issue](https://github.com/wrld3d/ios-api/issues).

## Contributing
If you wish to contribute to this repo, [pull requests](https://github.com/wrld3d/wrld.js) on GitHub are welcomed.

## License
The WRLD iOS SDK is released under the Simplified BSD License. See the [LICENSE.md](https://github.com/wrld3d/ios-api/blob/master/LICENSE.md) file for details.
