enum OrderInitParametersError {
  invalidMerchantId,
  invalidPrepayId,
  invalidTimestamp,
  invalidNonceStr,
  invalidCertSn,
  invalidSign,
  invalidRedirectScheme,
  unknown;

  static OrderInitParametersError fromString(String value) {
    switch (value) {
      case "invalidMerchantId":
        return invalidMerchantId;
      case "invalidPrepayId":
        return invalidPrepayId;
      case "invalidTimestamp":
        return invalidTimestamp;
      case "invalidNonceStr":
        return invalidNonceStr;
      case "invalidCertSn":
        return invalidCertSn;
      case "invalidSign":
        return invalidSign;
      case "invalidRedirectScheme":
        return invalidRedirectScheme;
      default:
        return unknown;
    }
  }
}

enum LanguageType {
  automatic,
  manual;
}

enum PayErrorType {
  invalidParameters,
  binanceAppNotInstalled,
  binanceAppNotSupported,
  openAppFailed,
  fromBinanceApp,
  undefinedParameters,
  canceled,
  unknown;

  static PayErrorType fromString(String value) {
    switch (value) {
      case "invalidParameters":
        return invalidParameters;
      case "binanceAppNotInstalled":
        return binanceAppNotInstalled;
      case "binanceAppNotSupported":
        return binanceAppNotSupported;
      case "openAppFailed":
        return openAppFailed;
      case "fromBinanceApp":
        return fromBinanceApp;
      case "undefinedParameters":
        return undefinedParameters;
      case "canceled":
        return canceled;
      default:
        return unknown;
    }
  }
}
