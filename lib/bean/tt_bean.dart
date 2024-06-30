import 'package:json_annotation/json_annotation.dart';

part 'tt_bean.g.dart';

@JsonSerializable()
class TtBean {
  final int? code;
  final List<Result>? result;
  final String? msg;

  const TtBean({
    this.code,
    this.result,
    this.msg,
  });

  factory TtBean.fromJson(Map<String, dynamic> json) => _$TtBeanFromJson(json);

  Map<String, dynamic> toJson() => _$TtBeanToJson(this);
}

@JsonSerializable()
class Result {
  final String? year;
  final String? title;
  final String? desc;
  final String? link;

  const Result({
    this.year,
    this.title,
    this.desc,
    this.link,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
