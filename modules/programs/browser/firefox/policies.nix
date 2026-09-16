{ lib, ... }:
let
  extensions = import ../extensions.nix { inherit lib; };
in
{
  AllowFileSelectionDialogs = true;
  AppAutoUpdate = false;
  AutofillAddressEnabled = false;
  AutofillCreditCardEnabled = false;
  #AutoLaunchProtocolsFromOrigins = { };
  BackgroundAppUpdate = false;
  BlockAboutAddons = false;
  BlockAboutConfig = false;
  BlockAboutProfiles = false;
  BlockAboutSupport = false;
  #Containers = { };
  DisableAppUpdate = true;
  DisableFirefoxAccounts = false;
  DisableFirefoxScreenshots = true;
  DisableFirefoxStudies = true;
  DisableFormHistory = false;
  DisableMasterPasswordCreation = true;
  DisablePocket = true;
  DisablePrivateBrowsing = false;
  DisableProfileImport = false;
  DisableProfileRefresh = false;
  DisableSafeMode = false;
  DisableTelemetry = true;
  DisableFeedbackCommands = true;
  DontCheckDefaultBrowser = true;
  DNSOverHTTPS = {
    Enabled = true;
  };
  EnableTrackingProtection = {
    Value = true;
    Locked = true;
    Cryptomining = true;
    Fingerprinting = true;
  };
  EncryptedMediaExtensions = {
    Enabled = true;
  };
  ExtensionUpdate = true;
  FirefoxHome = {
    Search = true;
    TopSites = false;
    SponsoredTopSites = false;
    Highlights = false;
    Pocket = false;
    SponsoredPocket = false;
    Snippets = false;
    Locked = false;
  };
  HardwareAcceleration = true;
  ManualAppUpdateOnly = true;
  NoDefaultBookmarks = false;
  OfferToSaveLogins = true;
  PasswordManagerEnabled = true;
  PictureInPicture = {
    Enabled = true;
  };
  PopupBlocking = {
    Allow = [ ];
    Default = true;
  };
  Preferences = {
    "browser.tabs.warnOnClose" = {
      Value = false;
    };
  };
  PromptForDownloadLocation = true;
  SearchSuggestEnabled = false;
  ShowHomeButton = false;
  StartDownloadsInTempDirectory = false;
  UserMessaging = {
    ExtensionRecommendations = false;
    SkipOnboarding = true;
  };
  ExtensionSettings = extensions.extensionSettings;
  "3rdparty".Extensions = extensions.extensionConfig;
}
