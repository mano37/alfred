class AppConfig {
  static const environment = String.fromEnvironment('ENV', defaultValue: 'dev');
  static const String apiBaseUrl = environment == 'dev'
      ? 'http://10.0.2.2:5000'
      : 'https://kjhprodapi.duckdns.org';
}
