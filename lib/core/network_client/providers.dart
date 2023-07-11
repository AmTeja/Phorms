// Use riverpod to provide the network client to the app.

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'network_client.dart';

final networkClientProvider = Provider<NetworkClient>((ref) {
  return NetworkClient();
});
