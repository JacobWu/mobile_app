class SXDetailsEntity{
  int f_No; //水箱编号
  num f_Temp; //水温
  num f_Flow; //水流量
  num f_SXQPRESSURE; //水箱前压力
  num f_SXHPRESSURE; // 水箱后压力

  SXDetailsEntity({
    this.f_No,
    this.f_Temp,
    this.f_Flow,
    this.f_SXQPRESSURE,
    this.f_SXHPRESSURE
  });

  SXDetailsEntity.fromJson(Map<String, dynamic> json){
    f_No = json['f_No'];
    f_Temp = json['f_Temp'];
    f_Flow = json['f_Flow'];
    f_SXQPRESSURE = json['f_SXQPRESSURE'];
    f_SXHPRESSURE = json['f_SXHPRESSURE'];
    }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['f_No'] = this.f_No;
    data['f_Temp'] = this.f_Temp;
    data['f_Flow'] = this.f_Flow;
    data['f_SXQPRESSURE'] = this.f_SXQPRESSURE;
    data['f_SXHPRESSURE'] = this.f_SXHPRESSURE;
    return data;
  }
}