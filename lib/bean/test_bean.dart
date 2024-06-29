class TestBean {
  TestBean({
    this.code,
    this.result,
    this.msg,
  });

  TestBean.fromJson(dynamic json) {
    code = json['code'];
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(Result.fromJson(v));
      });
    }
    msg = json['msg'];
  }

  int? code;
  List<Result>? result;
  String? msg;

  TestBean copyWith({
    int? code,
    List<Result>? result,
    String? msg,
  }) =>
      TestBean(
        code: code ?? this.code,
        result: result ?? this.result,
        msg: msg ?? this.msg,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    if (result != null) {
      map['result'] = result?.map((v) => v.toJson()).toList();
    }
    map['msg'] = msg;
    return map;
  }
}

class Result {
  Result({
    this.year,
    this.title,
    this.desc,
    this.link,
  });

  Result.fromJson(dynamic json) {
    year = json['year'];
    title = json['title'];
    desc = json['desc'];
    link = json['link'];
  }

  String? year;
  String? title;
  String? desc;
  String? link;

  Result copyWith({
    String? year,
    String? title,
    String? desc,
    String? link,
  }) =>
      Result(
        year: year ?? this.year,
        title: title ?? this.title,
        desc: desc ?? this.desc,
        link: link ?? this.link,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['year'] = year;
    map['title'] = title;
    map['desc'] = desc;
    map['link'] = link;
    return map;
  }
}
