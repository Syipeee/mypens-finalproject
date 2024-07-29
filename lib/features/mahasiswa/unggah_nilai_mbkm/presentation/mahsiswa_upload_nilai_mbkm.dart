import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MahasiswaUploadNilaiMBKM extends StatelessWidget {
  const MahasiswaUploadNilaiMBKM({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unggah Nilai MBKM"),
        scrolledUnderElevation: 0,
      ),
      body: const MahasiswaUploadNilai(),
    );
  }
}

class MahasiswaUploadNilai extends StatefulWidget {
  const MahasiswaUploadNilai({Key? key}) : super(key: key);

  @override
  _MahasiswaUploadNilaiState createState() => _MahasiswaUploadNilaiState();
}

class _MahasiswaUploadNilaiState extends State<MahasiswaUploadNilai>
    with SingleTickerProviderStateMixin {
  late AnimationController loadingController;
  File? _file;
  bool isLoading = false;
  bool isFileCanceled = false; // Tambahkan variabel ini
  int maxFileSizeKB = 200;

  void kirimFile() {
    // Periksa apakah file terpilih
    if (_file == null) {
      // Tampilkan pesan kesalahan jika tidak ada file yang terpilih
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Tidak Ada File Terpilih"),
            content: const Text("Harap pilih file sebelum mengirim."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
      return;
    }

    // Tampilkan dialog konfirmasi sebelum mengirim file
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Konfirmasi"),
          content: const Text("Apakah Anda yakin ingin mengirim file?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                sendFile();
              },
              child: const Text("Kirim"),
            ),
          ],
        );
      },
    );
  }

  void sendFile() {
    // Periksa ukuran file sebelum mengirim
    if (_file != null && (_file!.lengthSync() / 1024) > maxFileSizeKB) {
      // File terlalu besar, tampilkan popup
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("File Terlalu Besar"),
            content:
                Text("Ukuran file melebihi batas maksimal $maxFileSizeKB KB."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Perbarui halaman untuk memungkinkan pengguna mengunggah ulang
                  setState(() {
                    _file = null;
                    isLoading = false; // Reset state loading
                    isFileCanceled = true; // Setel isFileCanceled menjadi true
                  });
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
      return;
    }
    // Kirim file ke server
    // Simulasi pengiriman file
    setState(() {
      isLoading = true;
    });

    Future.delayed(
      const Duration(seconds: 5),
      () {
        loadingController.reset();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                'Anda berhasil mengupload file penilaian Mitra. Terima kasih! '),
            backgroundColor: Colors.green,
          ),
        );
        setState(() {
          isLoading = false;
          _file = null;
          isFileCanceled = false; // Setel isFileCanceled menjadi false
        });
        Navigator.of(context).pop();
      },
    );
  }

  void selectFile() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    if (pickedFile != null) {
      setState(() {
        _file = File(pickedFile.path);
        isFileCanceled = false;
      });
      loadingController.forward();
    } else {
      setState(() {
        _file = null;
        isFileCanceled = true;
        isLoading = false;
      });
      loadingController.reset();
      loadingController.stop();
    }
  }

  @override
  void initState() {
    loadingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed && isFileCanceled) {
          // Hentikan dan reset animasi jika file dibatalkan
          loadingController.reset();
        }
      });

    super.initState();
  }

  @override
  void dispose() {
    loadingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 20,
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/images/kampus-merdeka.png',
                width: 300,
              ),
              const SizedBox(height: 20),
              Text(
                'Upload your file',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'File should be jpg, png ',
                style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: selectFile,
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10),
                  dashPattern: const [10, 4],
                  strokeCap: StrokeCap.round,
                  color: Colors.blue.shade400,
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50.withOpacity(.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.folder_open,
                          color: Colors.blue,
                          size: 40,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'Select your file',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              _file != null
                  ? Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Selected File',
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade200,
                                  offset: const Offset(0, 1),
                                  blurRadius: 3,
                                  spreadRadius: 2,
                                )
                              ],
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(
                                    _file!,
                                    width: 70,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _file!.path.split('/').last,
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        '${(_file!.lengthSync() / 1024).ceil()} KB',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey.shade500,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Container(
                                        height: 5,
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.blue.shade50,
                                        ),
                                        child: LinearProgressIndicator(
                                          value: loadingController.value,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: InkWell(
                              onTap: isLoading ? null : kirimFile,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: isLoading
                                      ? const CircularProgressIndicator()
                                      : const Text(
                                          'Kirim',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ],
    );
  }
}
