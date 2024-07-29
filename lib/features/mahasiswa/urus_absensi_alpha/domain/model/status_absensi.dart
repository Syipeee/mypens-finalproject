enum StatusAbsensi {
  izin('Izin'), sakit('Sakit'), hadir('Hadir');

  final String value;
  const StatusAbsensi(this.value);
  @override
  String toString() => value;
}