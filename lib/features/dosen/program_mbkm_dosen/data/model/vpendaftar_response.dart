class Vpendaftar {
  String? nomor;
  String? mahasiswa;
  String? nrp;
  String? nama;
  String? vmitra;
  String? namaVmitra;
  String? kegiatan;
  String? namaKegiatan;
  String? pembimbing;
  String? namaPembimbing;
  String? kegiatanPosisi;
  String? posisi;
  String? nomorDosenWali;
  String? namaDosenWali;

  Vpendaftar({
    this.nomor,
    this.mahasiswa,
    this.nrp,
    this.nama,
    this.vmitra,
    this.namaVmitra,
    this.kegiatan,
    this.namaKegiatan,
    this.pembimbing,
    this.namaPembimbing,
    this.kegiatanPosisi,
    this.posisi,
    this.nomorDosenWali,
    this.namaDosenWali,
  });

  factory Vpendaftar.fromJson(Map<String, dynamic> json) {
    return Vpendaftar(
      nomor: json['NOMOR'],
      mahasiswa: json['NOMOR_MAHASISWA'],
      nrp: json['NRP'],
      nama: json['NAMA'],
      vmitra: json['VMITRA'],
      namaVmitra: json['NAMA_VMITRA'],
      kegiatan: json['KEGIATAN'],
      namaKegiatan: json['NAMA_KEGIATAN'],
      pembimbing: json['PEMBIMBING'],
      namaPembimbing: json['NAMA_PEMBIMBING'],
      kegiatanPosisi: json['KEGIATAN_POSISI'],
      posisi: json['POSISI'],
      nomorDosenWali: json['NOMOR_DOSEN_WALI'],
      namaDosenWali: json['NAMA_DOSEN_WALI'],
    );
  }

  Map<String, dynamic> toJson() => {
        'NOMOR': nomor,
        'NOMOR_MAHASISWA': mahasiswa,
        'NRP': nrp,
        'NAMA': nama,
        'KEGIATAN': kegiatan,
        'VMITRA': vmitra,
        'NAMA_VMITRA': namaVmitra,
        'NAMA_KEGIATAN': namaKegiatan,
        'PEMBIMBING': pembimbing,
        'NAMA_PEMBIMBING': namaPembimbing,
        'KEGIATAN_POSISI': kegiatanPosisi,
        'POSISI': posisi,
        'NOMOR_DOSEN_WALI': nomorDosenWali,
        'NAMA_DOSEN_WALI': namaDosenWali,
      };
}
