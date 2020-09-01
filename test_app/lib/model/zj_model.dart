class ZJDetailsEntity{
  int f_Section; //所在轧线：0：粗轧；1：中轧；2：预精轧；3：精轧
  int f_No; //所在轧机位：粗、中、预精轧为1~6， 精轧为1~10
  int f_Status; //运行状态(1: 正常运行，2:停止 - 后续增加更多状态)
  num f_Dl; //电流
  num f_Zs; //转速

  ZJDetailsEntity(
      {this.f_Section,
      this.f_No,
      this.f_Status,
      this.f_Dl,
      this.f_Zs
      });

  ZJDetailsEntity.fromJson(Map<String, dynamic> json){
    f_Section = json['f_Section'];
    f_No = json['f_No'];
    f_Status = json['f_Status'];
    f_Dl = json['f_Dl'];
    f_Zs = json['f_Zs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['f_Section'] = this.f_Section;
    data['f_No'] = this.f_No;
    data['f_Status'] = this.f_Status;
    data['f_Dl'] = this.f_Dl;
    data['f_Zs'] = this.f_Zs;
    return data;
  }
}