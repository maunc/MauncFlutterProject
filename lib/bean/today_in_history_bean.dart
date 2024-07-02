import 'package:json_annotation/json_annotation.dart';

part 'today_in_history_bean.g.dart';

@JsonSerializable()
class TodayInHistoryBean {
  final int? code;
  final List<TodayInHistoryResult>? result;
  final String? msg;

  const TodayInHistoryBean({
    this.code,
    this.result,
    this.msg,
  });

  factory TodayInHistoryBean.fromJson(Map<String, dynamic> json) =>
      _$TodayInHistoryBeanFromJson(json);

  Map<String, dynamic> toJson() => _$TodayInHistoryBeanToJson(this);
}

@JsonSerializable()
class TodayInHistoryResult {
  final String? year;
  final String? title;
  final String? desc;
  final String? link;

  const TodayInHistoryResult({
    this.year,
    this.title,
    this.desc,
    this.link,
  });

  factory TodayInHistoryResult.fromJson(Map<String, dynamic> json) =>
      _$TodayInHistoryResultFromJson(json);

  Map<String, dynamic> toJson() => _$TodayInHistoryResultToJson(this);
}
