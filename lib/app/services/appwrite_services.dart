import 'package:appwrite/appwrite.dart';

class AppwriteServices {
  Client get _client {
    Client client = Client();

    client
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('67133539002423b97456')
      .setSelfSigned(status: true);

    return client;
  }

  static Account get account => Account(_instance._client);
  static Databases get database => Databases(_instance._client);
  static Storage get storage => Storage(_instance._client);

  static final AppwriteServices _instance = AppwriteServices._internal();
  AppwriteServices._internal();
  factory AppwriteServices() => _instance;
}
