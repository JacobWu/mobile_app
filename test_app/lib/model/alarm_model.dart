class AlarmList {
  final List<LogL2Entity> alarms;

  AlarmList({
    this.alarms,

  });

  factory AlarmList.fromJson(List<dynamic> parsedJson) {

    List<LogL2Entity> Alarms = new List<LogL2Entity>();
    Alarms = parsedJson.map((i)=>LogL2Entity.fromJson(i)).toList();

    return new AlarmList(
        alarms: Alarms
    );
  }
}

class LogL2Entity{
  String f_ID; //事件号
  String f_BUSINESSID; //各业务表主键
  String f_TIME; //事件开始时间
  num f_TIMEDURATION; //事件持续事件(秒)
  num f_ZONE; //事件发生的区域(1：加热炉，2：轧区，3：精整，4：称重，5：轧辊, 100: 日统计存储过程)
  String f_DEVICE; //事件发生的设备(DB_dailystatpro)
  String f_REASON; //发生的原因(记录重要关键字：比如换辊，比如过流：实际值/额定值 等)
  num f_STATUS; //告警事件的状态，0：清除；1：一级告警

  LogL2Entity({
    this.f_ID,
    this.f_BUSINESSID,
    this.f_TIME,
    this.f_TIMEDURATION,
    this.f_ZONE,
    this.f_DEVICE,
    this.f_REASON,
    this.f_STATUS
  });

  LogL2Entity.fromJson(Map<String, dynamic> json){
    f_ID = json['f_ID'];
    f_BUSINESSID = json['f_BUSINESSID'];
    f_TIME = json['f_TIME'];
    f_TIMEDURATION = json['f_TIMEDURATION'];
    f_ZONE = json['f_ZONE'];
    f_DEVICE = json['f_DEVICE'];
    f_REASON = json['f_REASON'];
    f_STATUS = json['f_STATUS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['f_ID'] = this.f_ID;
    data['f_BUSINESSID'] = this.f_BUSINESSID;
    data['f_TIME'] = this.f_TIME;
    data['f_TIMEDURATION'] = this.f_TIMEDURATION;
    data['f_ZONE'] = this.f_ZONE;
    data['f_DEVICE'] = this.f_DEVICE;
    data['f_REASON'] = this.f_REASON;
    data['f_STATUS'] = this.f_STATUS;
    return data;
  }
}