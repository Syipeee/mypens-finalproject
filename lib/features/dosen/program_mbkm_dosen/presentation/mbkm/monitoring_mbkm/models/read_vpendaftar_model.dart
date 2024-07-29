class VPendaftarLogbook {
  final String nomor;
  final String nomorMahasiswa;
  final String nrp;
  final String nama;
  final String kegiatan;
  final String namaKegiatan;
  final String pembimbing;
  final String namaPembimbing;
  final String vmitra;
  final String namaVmitra;
  final String kegiatanPosisi;
  final String posisi;
  final String nomorDosenWali;
  final String namaDosenWali;
  final String urlFormNilaiMitra;
  final String namaKelempokKegiatan;
  final String nomorPenguji;
  final String namaPenguji;
  final String tanggalMulai;
  final String tanggalBerakhir;

  VPendaftarLogbook({
    required this.nomor,
    required this.nomorMahasiswa,
    required this.nrp,
    required this.nama,
    required this.kegiatan,
    required this.namaKegiatan,
    required this.pembimbing,
    required this.namaPembimbing,
    required this.vmitra,
    required this.namaVmitra,
    required this.kegiatanPosisi,
    required this.posisi,
    required this.nomorDosenWali,
    required this.namaDosenWali,
    required this.urlFormNilaiMitra,
    required this.namaKelempokKegiatan,
    required this.nomorPenguji,
    required this.namaPenguji,
    required this.tanggalMulai,
    required this.tanggalBerakhir,
  });

  factory VPendaftarLogbook.fromJson(Map<String, dynamic> json) {
    return VPendaftarLogbook(
      nomor: json['NOMOR'] ?? "",
      nomorMahasiswa: json['NOMOR_MAHASISWA'] ?? "",
      nrp: json['NRP'] ?? "",
      nama: json['NAMA'] ?? "",
      kegiatan: json['KEGIATAN'] ?? "",
      namaKegiatan: json['NAMA_KEGIATAN'] ?? "",
      pembimbing: json['PEMBIMBING'] ?? "",
      namaPembimbing: json['NAMA_PEMBIMBING'] ?? "",
      vmitra: json['VMITRA'] ?? "",
      namaVmitra: json['NAMA_VMITRA'] ?? "",
      kegiatanPosisi: json['KEGIATAN_POSISI'] ?? "",
      posisi: json['POSISI'] ?? "",
      nomorDosenWali: json['NOMOR_DOSEN_WALI'] ?? "",
      namaDosenWali: json['NAMA_DOSEN_WALI'] ?? "",
      urlFormNilaiMitra: json['URL_FORMNILAI_MITRA'] ?? "",
      namaKelempokKegiatan: json['NAMA_KELOMPOK_KEGIATAN'] ?? "",
      nomorPenguji: json['NOMOR_PENGUJI'] ?? "",
      namaPenguji: json['NAMA_PENGUJI'] ?? "",
      tanggalMulai: json['TANGGAL_AWAL'] ?? "",
      tanggalBerakhir: json['TANGGAL_AKHIR'] ?? "",
    );
  }
}
