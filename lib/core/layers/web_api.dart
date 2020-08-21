import 'package:chopper/chopper.dart';

import 'WebService.dart';
import 'network_config.dart';

class WebServer {
  static WebService _service;

  static WebService getApi() {
    if (_service == null) {
      final chopper = ChopperClient(
        baseUrl: NetworkConfig.getBaseUrl(),
        converter: FormUrlEncodedConverter(),
        services: [
          // the generated service
          WebService.create()
        ],
      );
      _service = WebService.create(chopper);
    }

    return _service;
  }
}
