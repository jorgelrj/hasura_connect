import 'package:hasura_connect/src/domain/entities/response.dart';
import 'package:hasura_connect/src/domain/entities/snapshot.dart';
import 'package:hasura_connect/src/domain/errors/errors.dart';
import 'package:hasura_connect/src/presenter/hasura_connect_base.dart';

import '../../domain/models/request.dart';

abstract class Interceptor {
  Future<dynamic>? onRequest(Request request);
  Future<dynamic>? onResponse(Response data);
  Future<dynamic>? onError(HasuraError request);
  Future<void>? onSubscription(Request request, Snapshot snapshot);
  Future<void>? onConnected(HasuraConnect connect);
  Future<void>? onTryAgain(HasuraConnect connect);
  Future<void>? onDisconnected();
}

abstract class InterceptorBase extends Interceptor {
  @override
  Future<void>? onConnected(HasuraConnect connect) {}

  @override
  Future<void>? onDisconnected() {}

  @override
  Future? onError(HasuraError error) async => error;

  @override
  Future? onRequest(Request request) async => request;

  @override
  Future? onResponse(Response data) async => data;

  @override
  Future<void>? onSubscription(Request request, Snapshot snapshot) {}

  @override
  Future<void>? onTryAgain(HasuraConnect connect) {}
}
