
class Data{
  String keterangan;
  bool checked;

  Data(this.keterangan, this.checked);

  Data.fromJson(Map<String, dynamic> json) : keterangan = json['keterangan'], 
  checked = json['checked'];

  Map<String, dynamic> toJson() => {'keterangan' : keterangan, 'checked' : checked};

  @override
  String toString() {

    return "$keterangan: $checked";
    
  }

}