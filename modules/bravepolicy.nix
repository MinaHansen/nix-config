{ ... }:
{
  environment.etc."brave/policies/GroupPolicy.json".text = ''
    {
      "BraveRewardsEnabled": false,
      "BraveWalletDisabled": true,
      "BraveVPNDisabled": true,
      "BraveTalkDisabled": true,
      "BraveNewsDisabled": true,
      "BraveAIChatEnabled": false,

      "MetricsReportingEnabled": false,
      "TelemetryEnabled": false,
      "BackgroundModeEnabled": false,

      "PasswordManagerEnabled": false,
      "AutofillAddressEnabled": false,
      "AutofillCreditCardEnabled": false,

      "DefaultSearchProviderEnabled": true,
      "DefaultSearchProviderName": "Kagi",
      "DefaultSearchProviderSearchURL": "https://kagi.com/search?q={searchTerms}",
      "DefaultSearchProviderSuggestURL": "https://kagi.com/api/autosuggest?q={searchTerms}",
      "DefaultSearchProviderIconURL": "https://kagi.com/favicon.ico",
      "DefaultSearchProviderKeyword": "kagi",

      "DNSOverHTTPSMode": "secure",
      "BuiltInDnsClientEnabled": true,

      "BlockThirdPartyCookies": true,
      "DefaultCookiesSetting": 1,

      "BraveShieldsEnabled": true,
      "BraveShieldsDefaultAdsSetting": "block",
      "BraveShieldsDefaultTrackersSetting": "block",
      "BraveShieldsDefaultFingerprintingSetting": "standard",

      "DefaultGeolocationSetting": 2,
      "DefaultNotificationsSetting": 2,
      "DefaultMediaStreamCameraSetting": 2,
      "DefaultMediaStreamMicSetting": 2,

      "WebRtcIPHandlingPolicy": "disable_non_proxied_udp",

      "SafeBrowsingEnabled": true,
      "SafeBrowsingExtendedReportingEnabled": false
    }
  '';
}
