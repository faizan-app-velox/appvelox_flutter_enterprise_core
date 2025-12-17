import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_user.freezed.dart';

@freezed
class TestUser with _$TestUser {
  const factory TestUser({required String name}) = _TestUser;
}