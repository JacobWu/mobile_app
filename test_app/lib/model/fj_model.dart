class FJDetailsEntity{
  int f_No; //飞剪编号
  num f_Dl; // 电流
  num f_JTTIMESET; //剪头时间设定
  num f_JWTIMESET; //剪尾时间设定
  num f_FJJTSPEED; //飞剪剪头速度
  num f_FJJWSPEED; //飞剪剪尾速度

  FJDetailsEntity({
    this.f_No,
    this.f_Dl,
    this.f_JTTIMESET,
    this.f_JWTIMESET,
    this.f_FJJTSPEED,
    this.f_FJJWSPEED
  });

  FJDetailsEntity.fromJson(Map<String, dynamic> json){
    f_No = json['f_No'];
    f_Dl = json['f_Dl'];
    f_JTTIMESET = json['f_JTTIMESET'];
    f_JWTIMESET = json['f_JWTIMESET'];
    f_FJJTSPEED = json['f_FJJTSPEED'];
    f_FJJWSPEED = json['f_FJJWSPEED'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['f_No'] = this.f_No;
    data['f_Dl'] = this.f_Dl;
    data['f_JTTIMESET'] = this.f_JTTIMESET;
    data['f_JWTIMESET'] = this.f_JWTIMESET;
    data['f_FJJTSPEED'] = this.f_FJJTSPEED;
    data['f_FJJWSPEED'] = this.f_FJJWSPEED;
    return data;
  }
}