class Vmitra {
  String? nomor;
  String? pic;
  String? namaPerusahaan;

  Vmitra({this.nomor, this.pic, this.namaPerusahaan});

  factory Vmitra.fromJson(Map<String, dynamic> json) {
    return Vmitra(
      nomor: json['NOMOR'],
      pic: json['PIC'],
      namaPerusahaan: json['NAMA_PERUSAHAAN'],
    );
  }

  Map<String, dynamic> toJson() => {
        'NOMOR': nomor,
        'PIC': pic,
        'NAMA_PERUSAHAAN': namaPerusahaan,
      };
}
