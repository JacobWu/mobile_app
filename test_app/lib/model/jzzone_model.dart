class JZZoneDetailsEntity{
  String f_TIME; //记录时间
  num f_FLGDSPEED; //风冷辊道转速
  num f_FLGDDL; //风冷辊道电流
  int f_SBSTATUS; //集卷筒隔板状态(0:合未动， 1：开未动， 2：开， 3： 合)
  int f_JJSTATUS; //集卷小车状态(0:静止待装钢，1：装钢，2：装钢移动，3：装钢静止待卸钢，4：卸钢，5：卸完钢静止，6：卸完钢复位)
  int f_XJSTATUS; //卸卷小车状态(0:静止待装钢，1：装钢，2：装钢移动，3：装钢静止待卸钢，4：卸钢，5：卸完钢静止，6：卸完钢复位)
  num f_SBDL; //双臂电流
  num f_SBSPEED; //双臂速度
  num f_JJDL; //集卷小车电流
  num f_JJSPEED; //集卷小车速度
  num f_XJDL; //卸卷小车电流
  num f_XJSPEED; //卸卷小车速度

  JZZoneDetailsEntity({
    this.f_TIME,
    this.f_FLGDSPEED,
    this.f_FLGDDL,
    this.f_SBSTATUS,
    this.f_JJSTATUS,
    this.f_XJSTATUS,
    this.f_SBDL,
    this.f_SBSPEED,
    this.f_JJDL,
    this.f_JJSPEED,
    this.f_XJDL,
    this.f_XJSPEED
    });

  JZZoneDetailsEntity.fromJson(Map<String, dynamic> json){
    f_TIME = json['f_TIME'];
    f_FLGDSPEED = json['f_FLGDSPEED'];
    f_FLGDDL = json['f_FLGDDL'];
    f_SBSTATUS = json['f_SBSTATUS'];
    f_JJSTATUS = json['f_JJSTATUS'];
    f_XJSTATUS = json['f_XJSTATUS'];
    f_SBDL = json['f_SBDL'];
    f_SBSPEED = json['f_SBSPEED'];
    f_JJDL = json['f_JJDL'];
    f_JJSPEED = json['f_JJSPEED'];
    f_XJDL = json['f_XJDL'];
    f_XJSPEED = json['f_XJSPEED'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['f_TIME'] = this.f_TIME;
    data['f_FLGDSPEED'] = this.f_FLGDSPEED;
    data['f_FLGDDL'] = this.f_FLGDDL;
    data['f_SBSTATUS'] = this.f_SBSTATUS;
    data['f_JJSTATUS'] = this.f_JJSTATUS;
    data['f_XJSTATUS'] = this.f_XJSTATUS;
    data['f_SBDL'] = this.f_SBDL;
    data['f_SBSPEED'] = this.f_SBSPEED;
    data['f_JJDL'] = this.f_JJDL;
    data['f_JJSPEED'] = this.f_JJSPEED;
    data['f_XJDL'] = this.f_XJDL;
    data['f_XJSPEED'] = this.f_XJSPEED;
    return data;
  }
}