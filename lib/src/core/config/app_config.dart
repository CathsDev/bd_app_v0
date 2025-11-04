abstract final class AppConfig {
  // App Info
  static const appName = 'BrainDump';
  static const version = '0.1.0';
  static const bool debugBanner = false;

  // Timeouts
  static const taskTimerDuration = Duration(minutes: 25);
  static const sessionTimeout = Duration(hours: 2);
}
