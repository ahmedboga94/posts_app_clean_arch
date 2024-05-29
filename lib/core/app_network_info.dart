import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class AppNetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements AppNetworkInfo {
  final InternetConnectionChecker internetConnectionChecker;

  NetworkInfoImpl(this.internetConnectionChecker);
  @override
  Future<bool> get isConnected => internetConnectionChecker.hasConnection;
}
