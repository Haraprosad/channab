import 'api_response_enum.dart';

class NetworkConfig {
  static const String errorMessage = "Something went wrong! please try again.";
  //get base url for the api
  static String getBaseUrl() {
    return "https://channab.com";
  }

  static ApiResponseType getApiStatus(int statusCode, String message) {
    switch (statusCode) {
      case 200:
        {
          return ApiResponseType.SUCCESS;
        }
        break;
      case 400:
        {
          if (message != 'Success' || message != null) {
            return ApiResponseType.ERROR;
          } else {
            return ApiResponseType.BAD_REQUEST;
          }
        }
        break;
      case 401:
        {
          return ApiResponseType.ON_SESSION_OUT;
        }
        break;
      default:
        {
          return ApiResponseType.BAD_REQUEST;
        }
    }
  }
}
