// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tt_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TtBean _$TtBeanFromJson(Map<String, dynamic> json) => TtBean(
      code: (json['code'] as num?)?.toInt(),
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$TtBeanToJson(TtBean instance) => <String, dynamic>{
      'code': instance.code,
      'result': instance.result,
      'msg': instance.msg,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      year: json['year'] as String?,
      title: json['title'] as String?,
      desc: json['desc'] as String?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'year': instance.year,
      'title': instance.title,
      'desc': instance.desc,
      'link': instance.link,
    };
