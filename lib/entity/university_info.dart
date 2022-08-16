class UniversityInfo {
  UniversityInfo({
    String? province,
    List<Schools>? schools,
  }) {
    _province = province;
    _schools = schools;
  }

  UniversityInfo.fromJson(dynamic json) {
    _province = json['province'];
    if (json['schools'] != null) {
      _schools = [];
      json['schools'].forEach((v) {
        _schools?.add(Schools.fromJson(v));
      });
    }
  }
  String? _province;
  List<Schools>? _schools;
  UniversityInfo copyWith({
    String? province,
    List<Schools>? schools,
  }) =>
      UniversityInfo(
        province: province ?? _province,
        schools: schools ?? _schools,
      );
  String? get province => _province;
  List<Schools>? get schools => _schools;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['province'] = _province;
    if (_schools != null) {
      map['schools'] = _schools?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// name : "南开大学"
/// code : "4112010055"
/// supervisor : "教育部"
/// city : "天津市"
/// level : "本科"
/// type : "公办"

class Schools {
  Schools({
    String? name,
    String? code,
    String? supervisor,
    String? city,
    String? level,
    String? type,
  }) {
    _name = name;
    _code = code;
    _supervisor = supervisor;
    _city = city;
    _level = level;
    _type = type;
  }

  Schools.fromJson(dynamic json) {
    _name = json['name'];
    _code = json['code'];
    _supervisor = json['supervisor'];
    _city = json['city'];
    _level = json['level'];
    _type = json['type'];
  }
  String? _name;
  String? _code;
  String? _supervisor;
  String? _city;
  String? _level;
  String? _type;
  Schools copyWith({
    String? name,
    String? code,
    String? supervisor,
    String? city,
    String? level,
    String? type,
  }) =>
      Schools(
        name: name ?? _name,
        code: code ?? _code,
        supervisor: supervisor ?? _supervisor,
        city: city ?? _city,
        level: level ?? _level,
        type: type ?? _type,
      );
  String? get name => _name;
  String? get code => _code;
  String? get supervisor => _supervisor;
  String? get city => _city;
  String? get level => _level;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['code'] = _code;
    map['supervisor'] = _supervisor;
    map['city'] = _city;
    map['level'] = _level;
    map['type'] = _type;
    return map;
  }
}
