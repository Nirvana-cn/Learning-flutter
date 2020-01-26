class Version {
  IOS iosStarcharge;
  Android androidStarcharge;

  Version(this.iosStarcharge, this.androidStarcharge);

  factory Version.fromJson(Map<String, dynamic> json){
    IOS iosStarcharge = IOS.fromJson(json["iosStarcharge"]);
    Android androidStarcharge = Android.fromJson(json["androidStarcharge"]);
    return Version(iosStarcharge, androidStarcharge);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'iosStarcharge': iosStarcharge,
    'androidStarcharge': androidStarcharge,
  };
}

class IOS {
  String minimum;
  String maximum;
  int updateEnabled;

  IOS(this.minimum, this.maximum, this.updateEnabled);

  IOS.fromJson(Map<String, dynamic> json)
      : minimum = json["minimum"],
        maximum = json["maximum"],
        updateEnabled = json["updateEnabled"];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'minimum': minimum,
        'maximum': maximum,
        'updateEnabled': updateEnabled,
      };
}

class Android {
  String minimum;
  String maximum;
  int updateEnabled;
  String appUrl;
  String appChangeLog;

  Android(this.minimum, this.maximum, this.updateEnabled, this.appUrl, this.appChangeLog);

  Android.fromJson(Map<String, dynamic> json)
      : minimum = json["minimum"],
        maximum = json["maximum"],
        updateEnabled = json["updateEnabled"],
        appUrl = json["appUrl"],
        appChangeLog = json["appChangeLog"];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'minimum': minimum,
        'maximum': maximum,
        'updateEnabled': updateEnabled,
        'appUrl': appUrl,
        'appChangeLog': appChangeLog,
      };
}
