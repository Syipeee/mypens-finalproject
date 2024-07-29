class VPendafatarByIdDosen {
  final String nomor;
  final String nomorMahasiswa;
  final String nrp;
  final String nama;
  final String kegiatan;
  final String namaKegiatan;
  final String pembimbing;
  final String namaPembimbing;
  final String vmitra;
  final String namaVMitra;
  final String kegiatanPosisi;
  final String posisi;
  final String nomorDosenWali;
  final String namaDosenWali;

  VPendafatarByIdDosen ({
    required this.nomor,
    required this.nomorMahasiswa,
    required this.nrp,
    required this.nama,
    required this.kegiatan,
    required this.namaKegiatan,
    required this.pembimbing,
    required this.namaPembimbing,
    required this.vmitra,
    required this.namaVMitra,
    required this.kegiatanPosisi,
    required this.posisi,
    required this.nomorDosenWali,
    required this.namaDosenWali,
});

  factory VPendafatarByIdDosen.fromJson(Map<String, dynamic> json) {
    return VPendafatarByIdDosen(
      nomor: json['NOMOR'],
      nomorMahasiswa: json['NOMOR_MAHASISWA'],
      nrp: json['NRP'],
      nama: json['NAMA'],
      kegiatan: json['KEGIATAN'],
      namaKegiatan: json['NAMA_KEGIATAN'],
      pembimbing: json['PEMBIMBING'] ?? '',
      namaPembimbing: json['NAMA_PEMBIMBING'] ?? '',
      vmitra: json['VMITRA'],
      namaVMitra: json['NAMA_VMITRA'],
      kegiatanPosisi: json['KEGIATAN_POSISI'],
      posisi: json['POSISI'],
      nomorDosenWali: json['NOMOR_DOSEN_WALI'],
      namaDosenWali: json['NAMA_DOSEN_WALI'],
    );
  }
}