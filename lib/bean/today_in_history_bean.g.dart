// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_in_history_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodayInHistoryBean _$TodayInHistoryBeanFromJson(Map<String, dynamic> json) =>
    TodayInHistoryBean(
      code: (json['code'] as num?)?.toInt(),
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => TodayInHistoryResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$TodayInHistoryBeanToJson(TodayInHistoryBean instance) =>
    <String, dynamic>{
      'code': instance.code,
      'result': instance.result,
      'msg': instance.msg,
    };

TodayInHistoryResult _$TodayInHistoryResultFromJson(
        Map<String, dynamic> json) =>
    TodayInHistoryResult(
      year: json['year'] as String?,
      title: json['title'] as String?,
      desc: json['desc'] as String?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$TodayInHistoryResultToJson(
        TodayInHistoryResult instance) =>
    <String, dynamic>{
      'year': instance.year,
      'title': instance.title,
      'desc': instance.desc,
      'link': instance.link,
    };
