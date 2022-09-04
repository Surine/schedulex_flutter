/// jwUrl : "https://ssfw.scuec.edu.cn/ssfw/cas_index.jsp"
/// author : "Muzzle"
/// backup : [""]
/// type : 0
/// status : 0

class AdapterInfo {
  AdapterInfo({
      String? jwUrl, 
      String? author, 
      List<String>? backup, 
      int? type, 
      int? status,}){
    _jwUrl = jwUrl;
    _author = author;
    _backup = backup;
    _type = type;
    _status = status;
}

  AdapterInfo.fromJson(dynamic json) {
    _jwUrl = json['jwUrl'];
    _author = json['author'];
    _backup = json['backup'] != null ? json['backup'].cast<String>() : [];
    _type = json['type'];
    _status = json['status'];
  }
  String? _jwUrl;
  String? _author;
  List<String>? _backup;
  int? _type;
  int? _status;
AdapterInfo copyWith({  String? jwUrl,
  String? author,
  List<String>? backup,
  int? type,
  int? status,
}) => AdapterInfo(  jwUrl: jwUrl ?? _jwUrl,
  author: author ?? _author,
  backup: backup ?? _backup,
  type: type ?? _type,
  status: status ?? _status,
);
  String? get jwUrl => _jwUrl;
  String? get author => _author;
  List<String>? get backup => _backup;
  int? get type => _type;
  int? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['jwUrl'] = _jwUrl;
    map['author'] = _author;
    map['backup'] = _backup;
    map['type'] = _type;
    map['status'] = _status;
    return map;
  }

}