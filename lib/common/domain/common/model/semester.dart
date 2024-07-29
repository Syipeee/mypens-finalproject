enum Semester {
  ganjil(id: 1, name: 'Ganjil', comparisonValue: 1),
  genap(id: 2, name: 'Genap', comparisonValue: 3),
  ganjilAntara(id: 3, name: 'Semester Antara Ganjil', comparisonValue: 2),
  genapAntara(id: 4, name: 'Semester Antara Genap', comparisonValue: 4);

  final int id;
  final String name;
  /// Untuk comparison ketika sorting
  final int comparisonValue;
  const Semester({
    required this.id,
    required this.name,
    required this.comparisonValue,
  });

  static Semester fromId(int id){
    return Semester.values.singleWhere((semester) =>
      semester.id == id
    );
  }
}