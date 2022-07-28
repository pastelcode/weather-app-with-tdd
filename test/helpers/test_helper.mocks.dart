// Mocks generated by Mockito 5.2.0 from annotations
// in flutter_weather_app_with_tdd/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:convert' as _i10;
import 'dart:typed_data' as _i11;

import 'package:dartz/dartz.dart' as _i2;
import 'package:flutter_weather_app_with_tdd/data/failure.dart' as _i7;
import 'package:flutter_weather_app_with_tdd/domain/entities/weather.dart'
    as _i8;
import 'package:flutter_weather_app_with_tdd/domain/repositories/weather_repository.dart'
    as _i5;
import 'package:http/src/base_request.dart' as _i12;
import 'package:http/src/client.dart' as _i9;
import 'package:http/src/response.dart' as _i3;
import 'package:http/src/streamed_response.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

class _FakeResponse_1 extends _i1.Fake implements _i3.Response {}

class _FakeStreamedResponse_2 extends _i1.Fake implements _i4.StreamedResponse {
}

/// A class which mocks [WeatherRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockWeatherRepository extends _i1.Mock implements _i5.WeatherRepository {
  MockWeatherRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, _i8.Weather>> getCurrentWeather(
          String? cityName) =>
      (super.noSuchMethod(Invocation.method(#getCurrentWeather, [cityName]),
              returnValue: Future<_i2.Either<_i7.Failure, _i8.Weather>>.value(
                  _FakeEither_0<_i7.Failure, _i8.Weather>()))
          as _i6.Future<_i2.Either<_i7.Failure, _i8.Weather>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i9.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i3.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<_i3.Response>.value(_FakeResponse_1()))
          as _i6.Future<_i3.Response>);
  @override
  _i6.Future<_i3.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<_i3.Response>.value(_FakeResponse_1()))
          as _i6.Future<_i3.Response>);
  @override
  _i6.Future<_i3.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i10.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i3.Response>.value(_FakeResponse_1()))
          as _i6.Future<_i3.Response>);
  @override
  _i6.Future<_i3.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i10.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i3.Response>.value(_FakeResponse_1()))
          as _i6.Future<_i3.Response>);
  @override
  _i6.Future<_i3.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i10.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i3.Response>.value(_FakeResponse_1()))
          as _i6.Future<_i3.Response>);
  @override
  _i6.Future<_i3.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i10.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i3.Response>.value(_FakeResponse_1()))
          as _i6.Future<_i3.Response>);
  @override
  _i6.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<_i11.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<_i11.Uint8List>.value(_i11.Uint8List(0)))
          as _i6.Future<_i11.Uint8List>);
  @override
  _i6.Future<_i4.StreamedResponse> send(_i12.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue:
                  Future<_i4.StreamedResponse>.value(_FakeStreamedResponse_2()))
          as _i6.Future<_i4.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
}
