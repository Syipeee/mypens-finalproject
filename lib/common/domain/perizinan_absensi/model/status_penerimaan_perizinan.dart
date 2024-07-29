enum StatusPenerimaanPerizinan {
  diterima(1), ditolak(2), menunggu(0);

  final int id;
  const StatusPenerimaanPerizinan(this.id);

  static StatusPenerimaanPerizinan from({required int id}){
    return StatusPenerimaanPerizinan.values.singleWhere(
      (status) => status.id == id
    );
  }
}