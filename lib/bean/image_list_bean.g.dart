// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_list_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageListBean _$ImageListBeanFromJson(Map<String, dynamic> json) =>
    ImageListBean(
      code: (json['code'] as num?)?.toInt(),
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => ImageListResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$ImageListBeanToJson(ImageListBean instance) =>
    <String, dynamic>{
      'code': instance.code,
      'result': instance.result,
      'msg': instance.msg,
    };

ImageListResult _$ImageListResultFromJson(Map<String, dynamic> json) =>
    ImageListResult(
      copyright: json['copyright'] as String?,
      copyrightlink: json['copyrightlink'] as String?,
      title: json['title'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ImageListResultToJson(ImageListResult instance) =>
    <String, dynamic>{
      'copyright': instance.copyright,
      'copyrightlink': instance.copyrightlink,
      'title': instance.title,
      'url': instance.url,
    };
