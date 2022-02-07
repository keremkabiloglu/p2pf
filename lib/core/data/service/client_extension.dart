enum Server {
  url,
  port,
  emitAuthToken,
  getAuthResponse,
}

extension ServerExtension on Server {
  String get string {
    switch (this) {
      case Server.url:
        return 'http://192.168.1.101';
      case Server.port:
        return '3000';
      case Server.emitAuthToken:
        return 'auth:token';
      case Server.getAuthResponse:
        return 'auth:response';
      default:
        throw Exception('Undefined parameter');
    }
  }
}
