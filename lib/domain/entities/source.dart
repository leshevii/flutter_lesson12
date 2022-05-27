import 'package:freezed_annotation/freezed_annotation.dart';

part 'source.freezed.dart';

@freezed
class Source with _$Source {
  factory Source({required String? id, required String name}) = _Source;
}
