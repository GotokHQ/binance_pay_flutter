import Flutter
import UIKit
import BinancePaySDK

public class SwiftBinancePayPlugin: NSObject, FlutterPlugin {
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "binance_pay", binaryMessenger: registrar.messenger())
        let instance = SwiftBinancePayPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
        registrar.addApplicationDelegate(instance)
    }
    
    public static func RootViewController() -> UIViewController? {
        return UIApplication.shared.keyWindow?.rootViewController;
    }
    
    public static func TopViewControllerForViewController(controller viewController: UIViewController?) -> UIViewController? {
        if ((viewController?.presentedViewController) != nil) {
            return TopViewControllerForViewController(controller: viewController!.presentedViewController);
        }
        if (viewController is UINavigationController) {
            return TopViewControllerForViewController(controller: (viewController as! UINavigationController).visibleViewController);
        }
        return viewController;
    }
    
    public func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {
        print("start handle open url")
        return BinancePay.shared.handle(openURL: url)
    }
    
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "init":
            guard let args = call.arguments as? Dictionary<String, Any> else {
                result(FlutterError(
                    code: "",
                    message: "Invalid argument", details: nil));
                break
            }
            let merchantId : String  =  args["merchantId"]! as! String
            let prepayId : String  =  args["prepayId"]! as! String
            let timestamp : Int64  =  args["timestamp"]! as! Int64
            let noncestr: String  =  args["noncestr"]! as! String
            let certSn: String  =  args["certSn"]! as! String
            let sign: String  =  args["sign"]! as! String
            let redirectScheme: String  =  args["redirectScheme"]! as! String
            guard let rootView = UIApplication.shared.windows.first else {
                result(FlutterError(
                    code: "",
                    message: "Invalid view", details: nil));
                break
            }
            let parameters = OrderInitParameters(merchantId: merchantId, prepayId: prepayId, timestamp: timestamp, noncestr: noncestr, certSn: certSn, sign: sign, redirectScheme: redirectScheme);
            
                print("redirectScheme: \(redirectScheme)")
            BinancePay.shared.pay(with: parameters, containerView: rootView) { (binanceResult) in
                switch binanceResult {
                case .success:
                    print("success")
                    result(true);
                    break;
                case .failure(let error):
                    print("failure \(error)")
                    var errorCode: String = "";
                    var errorMessage: String = error.localizedDescription;
                    var someDict: [String: Any]? = nil;
                    switch error {
                    case .invalidParameters(let code):
                        errorCode = "invalidParameters";
                        someDict = ["code":"\(code)"]
                        break;
                    case .binanceAppNotInstalled:
                        errorCode = "binanceAppNotInstalled";
                        break;
                    case  .binanceAppNotSupported:
                        errorCode = "binanceAppNotSupported";
                        break;
                    case  .openAppFailed:
                        errorCode = "openAppFailed";
                        break;
                    case  .fromBinanceApp(let code, let message):
                        errorCode = "fromBinanceApp";
                        errorMessage = "\(code):\(message)";
                        someDict = ["code":code, "message":message]
                        break;
                    case .undefinedParameters:
                        errorCode = "undefinedParameters";
                        break;
                    @unknown default:
                        errorCode = "unknown";
                    }
                    result(FlutterError(
                        code: errorCode,
                        message: errorMessage, details: someDict));
                }
            }
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
