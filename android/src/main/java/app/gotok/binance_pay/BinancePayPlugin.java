package app.gotok.binance_pay;

import androidx.annotation.NonNull;

import com.binance.android.binancepay.api.BinancePayException;
import com.binance.android.binancepay.api.BinancePayFactory;
import com.binance.android.binancepay.api.BinancePayListener;
import com.binance.android.binancepay.api.BinancePayParam;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** BinancePayPlugin */
public class BinancePayPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "binance_pay");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("init")) {
      String merchantId = (String) call.argument("merchantId");
      String prepayId = (String) call.argument("prepayId");
      String timeStamp = (String) call.argument("timeStamp");
      String nonceStr = (String) call.argument("nonceStr");
      String certSn = (String) call.argument("certSn");
      String sign = (String) call.argument("sign");
      BinancePayParam params = new BinancePayParam(merchantId, prepayId, timeStamp, nonceStr, certSn, sign);
      BinancePayFactory.instance.pay(params, new BinancePayListener() {
        @Override
        public void onSuccess() {
          result.success(true);
        }

        @Override
        public void onCancel() {
          result.success(null);
        }

        @Override
        public void onError(@NonNull BinancePayException e) {
          result.error(e.getMessage(), e.getLocalizedMessage(), null);
        }
      });
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
