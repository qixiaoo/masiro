import 'dart:convert';

CommonResponse commonResponseFromJson(String str) =>
    CommonResponse.fromJson(json.decode(str));

String commonResponseToJson(CommonResponse data) => json.encode(data.toJson());

class CommonResponse {
  int code;
  String msg;

  CommonResponse({
    required this.code,
    required this.msg,
  });

  factory CommonResponse.fromJson(Map<String, dynamic> json) => CommonResponse(
        code: json['code'],
        msg: json['msg'],
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'msg': msg,
      };
}
