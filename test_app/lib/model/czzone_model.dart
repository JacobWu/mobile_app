class CZZoneDetailsEntity{
  String f_TIME; //记录时间
  num f_CSTATUS1TO32; //C型钩状态标记1 -32号(0: 无钢卷， 1：有钢卷)
  num f_CSTATUS33TO64; //C型钩状态标记33 -64号(0: 无钢卷， 1：有钢卷)
  num f_CSTATUS65TO96; //C型钩状态标记65 -96号(0: 无钢卷， 1：有钢卷)
  num f_PFSPEED; //PF线速度
  num f_PFDL; //PF线电流
  num f_CNUMISCZ; //上次完成称重的钩号
  num f_GJWEIGHT; //上次完成称重的钢卷重量
  num f_CNUMISDK; //上次完成打捆的钩号
  num f_CNUMISZG; //上次完成从集卷小车装钢的钩号
  num f_CNUMISXG; //上次完成从往卸卷小车卸钢的钩号

  CZZoneDetailsEntity({
    this.f_TIME,
    this.f_CSTATUS1TO32,
    this.f_CSTATUS33TO64,
    this.f_CSTATUS65TO96,
    this.f_PFSPEED,
    this.f_PFDL,
    this.f_CNUMISCZ,
    this.f_GJWEIGHT,
    this.f_CNUMISDK,
    this.f_CNUMISZG,
    this.f_CNUMISXG});

  CZZoneDetailsEntity.fromJson(Map<String, dynamic> json){
    f_TIME = json['f_TIME'];
    f_CSTATUS1TO32 = json['f_CSTATUS1TO32'];
    f_CSTATUS33TO64 = json['f_CSTATUS33TO64'];
    f_CSTATUS65TO96 = json['f_CSTATUS65TO96'];
    f_PFSPEED = json['f_PFSPEED'];
    f_PFDL = json['f_PFDL'];
    f_CNUMISCZ = json['f_CNUMISCZ'];
    f_GJWEIGHT = json['f_GJWEIGHT'];
    f_CNUMISDK = json['f_CNUMISDK'];
    f_CNUMISZG = json['f_CNUMISZG'];
    f_CNUMISXG = json['f_CNUMISXG'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['f_TIME'] = this.f_TIME;
    data['f_CSTATUS1TO32'] = this.f_CSTATUS1TO32;
    data['f_CSTATUS33TO64'] = this.f_CSTATUS33TO64;
    data['f_CSTATUS65TO96'] = this.f_CSTATUS65TO96;
    data['f_PFSPEED'] = this.f_PFSPEED;
    data['f_PFDL'] = this.f_PFDL;
    data['f_CNUMISCZ'] = this.f_CNUMISCZ;
    data['f_GJWEIGHT'] = this.f_GJWEIGHT;
    data['f_CNUMISDK'] = this.f_CNUMISDK;
    data['f_CNUMISZG'] = this.f_CNUMISZG;
    data['f_CNUMISXG'] = this.f_CNUMISXG;
    return data;
  }
}