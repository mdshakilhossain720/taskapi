import 'user_data.dart';

class loginresponse {
  String? status;
  String? token;
  userData? data;

  loginresponse({this.status, this.token, this.data});

  loginresponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    data = json['data'] != null ?  userData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['status'] = this.status;
    data['token'] = this.token;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}


