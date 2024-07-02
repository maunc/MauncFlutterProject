import 'package:json_annotation/json_annotation.dart';

part 'image_list_bean.g.dart';

@JsonSerializable()
class ImageListBean {
  final int? code;
  final List<ImageListResult>? result;
  final String? msg;

  const ImageListBean({
    this.code,
    this.result,
    this.msg,
  });

  factory ImageListBean.fromJson(Map<String, dynamic> json) =>
      _$ImageListBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ImageListBeanToJson(this);
}

@JsonSerializable()
class ImageListResult {
  final String? copyright;
  final String? copyrightlink;
  final String? title;
  final String? url;

  const ImageListResult({
    this.copyright,
    this.copyrightlink,
    this.title,
    this.url,
  });

  factory ImageListResult.fromJson(Map<String, dynamic> json) =>
      _$ImageListResultFromJson(json);

  Map<String, dynamic> toJson() => _$ImageListResultToJson(this);
}
