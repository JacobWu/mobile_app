class JRLDetailsEntity {
  String f_Time; //记录时间
  num f_InTemp; //炉内温度
  num f_MQPRESSURE; //燃气压力
  num f_YSKQPRESSURE; //压缩空气压力
  num f_DQPRESSURE; //氮气压力
  num f_RSPRESSURE; //软水压力
  num f_MQFLOW; //燃气瞬时流量
  num f_ZQFLOW; //蒸汽瞬时流量
  num f_GPNUMINYRD; //预热段钢胚根数
  num f_GPNUMINJIARD; //加热段钢胚根数
  num f_GPNUMINJUNRD; //均热段钢胚根数
  num f_GPNUM; //炉内钢胚根数

  JRLDetailsEntity(
      {this.f_Time,
      this.f_InTemp,
      this.f_MQPRESSURE,
      this.f_YSKQPRESSURE,
      this.f_DQPRESSURE,
      this.f_RSPRESSURE,
      this.f_MQFLOW,
      this.f_ZQFLOW,
      this.f_GPNUMINYRD,
      this.f_GPNUMINJIARD,
      this.f_GPNUMINJUNRD,
      this.f_GPNUM});

  JRLDetailsEntity.fromJson(Map<String, dynamic> json) {
    f_Time = json['f_TIME'];
    f_InTemp = json['f_InTemp'];
    f_MQPRESSURE = json['f_MQPRESSURE'];
    f_YSKQPRESSURE = json['f_YSKQPRESSURE'];
    f_DQPRESSURE = json['f_DQPRESSURE'];
    f_RSPRESSURE = json['f_RSPRESSURE'];
    f_MQFLOW = json['f_MQFLOW'];
    f_ZQFLOW = json['f_ZQFLOW'];
    f_GPNUMINYRD = json['f_GPNUMINYRD'];
    f_GPNUMINJIARD = json['f_GPNUMINJIARD'];
    f_GPNUMINJUNRD = json['f_GPNUMINJUNRD'];
    f_GPNUM = json['f_GPNUM'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['f_TIME'] = this.f_Time;
    data['f_InTemp'] = this.f_InTemp;
    data['f_MQPRESSURE'] = this.f_MQPRESSURE;
    data['f_YSKQPRESSURE'] = this.f_YSKQPRESSURE;
    data['f_DQPRESSURE'] = this.f_DQPRESSURE;
    data['f_RSPRESSURE'] = this.f_RSPRESSURE;
    data['f_MQFLOW'] = this.f_MQFLOW;
    data['f_ZQFLOW'] = this.f_ZQFLOW;
    data['f_GPNUMINYRD'] = this.f_GPNUMINYRD;
    data['f_GPNUMINJIARD'] = this.f_GPNUMINJIARD;
    data['f_GPNUMINJUNRD'] = this.f_GPNUMINJUNRD;
    data['f_GPNUM'] = this.f_GPNUM;
    return data;
  }
}
