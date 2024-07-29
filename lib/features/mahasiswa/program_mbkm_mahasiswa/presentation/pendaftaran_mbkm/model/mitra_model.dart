class Mitra {
  final String nomor;
  final String namaPerusahaan;
  final String bidangUsaha;
  final String alamat;
  final String kota;
  final String provinsi;
  final String negara;
  final String telp;
  final String namaCp;
  final String emailCp;
  final String nohpCp;
  final String pic;
  final String mulaiKerjasama;
  final String akhirKerjasama;
  final String username;
  final String password;

  Mitra({
    required this.nomor,
    required this.namaPerusahaan,
    required this.bidangUsaha,
    required this.alamat,
    required this.kota,
    required this.provinsi,
    required this.negara,
    required this.telp,
    required this.namaCp,
    required this.emailCp,
    required this.nohpCp,
    required this.pic,
    required this.mulaiKerjasama,
    required this.akhirKerjasama,
    required this.username,
    required this.password,
  });

  factory Mitra.fromJson(Map<String, dynamic> json) {
    return Mitra(
      nomor: json['NOMOR'] ?? "",
      namaPerusahaan: json['NAMA_PERUSAHAAN'] ?? "",
      bidangUsaha: json['BIDANG_USAHA'] ?? "",
      alamat: json['ALAMAT'] ?? "",
      kota: json['KOTA'] ?? "",
      provinsi: json['PROVINSI'] ?? "",
      negara: json['NEGARA'] ?? "",
      telp: json['TELP'] ?? "",
      namaCp: json['NAMA_CP'] ?? "",
      emailCp: json['EMAIL_CP'] ?? "",
      nohpCp: json['NOHP_CP'] ?? "",
      pic: json['PIC'] ?? "",
      mulaiKerjasama: json['MULAI_KERJASAMA'] ?? "",
      akhirKerjasama: json['AKHIR_KERJASAMA'] ?? "",
      username: json['USERNAME'] ?? "",
      password: json['PASSWORD'] ?? "",
    );
  }
}
