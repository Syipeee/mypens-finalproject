import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/components/custom_form.dart';

class EditDialog {
  static void show(
    BuildContext parentContext,
    BuildContext context,
    String initialTanggal,
    String initialNilai,
    Function(String, String) onSaveWithDate, // Tambahkan parameter baru
  ) {
    TextEditingController nilaiController =
        TextEditingController(text: initialNilai);
    TextEditingController tanggalController =
        TextEditingController(text: initialTanggal);

    showModalBottomSheet(
      context: parentContext,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Edit Nilai MBKM',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomForm(
                    hintText: 'Nilai MBKM',
                    controller: nilaiController,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Harap isi nilai MBKM';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      _selectDate(
                        context,
                        tanggalController,
                      );
                    },
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: tanggalController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Update Tanggal',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      onSaveWithDate(
                          nilaiController.text, tanggalController.text);
                      // onSave(tanggalController.text);
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(double.infinity, 40),
                    ),
                    child: const Text(
                      'Simpan',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      // Format tanggal sesuai dengan 'dd-MM-yyyy'
      final formattedDate = DateFormat('dd-MM-yyyy').format(picked);
      controller.text = formattedDate;
      print(formattedDate);
    }
  }
}

class DeleteDialog {
  static void show(
    BuildContext parentContext,
    VoidCallback onDelete,
  ) {
    showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hapus Nilai MBKM'),
          content:
              const Text('Apakah Anda yakin ingin menghapus nilai MBKM ini?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                onDelete(); // Panggil fungsi onDelete saat tombol "Hapus" ditekan
                Navigator.of(context).pop();
              },
              child: const Text('Hapus'),
            ),
          ],
        );
      },
    );
  }
}
