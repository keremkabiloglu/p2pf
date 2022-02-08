enum SocketSettings {
  url,
  port,
  timeOut,
  registerAnEmit,
}

extension SocketExtension on SocketSettings {
  dynamic get value {
    switch (this) {
      case SocketSettings.url:
        return 'http://192.168.1.101';
      case SocketSettings.port:
        return ':3000';
      case SocketSettings.timeOut:
        return 10;
      default:
        throw Exception('undefined parameter');
    }
  }
}
