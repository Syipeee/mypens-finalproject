import 'package:flutter/material.dart';
import 'package:mypens/constants/colors.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/kategori_assessment_response.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/pendaftar_response.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/model/vmitra_response.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/components/custom_dropdown.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/components/custom_form.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/providers/kategori_assessment_providers.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/providers/insert_assessment_providers.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/providers/pendaftar_providers.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/providers/vmitra_providers.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/mbkm/penilaian_mbkm/read_assessement_page.dart';
import 'package:provider/provider.dart' as provider;

class InsertAssessmentPage extends StatefulWidget {
  const InsertAssessmentPage({Key? key}) : super(key: key);

  @override
  State<InsertAssessmentPage> createState() => _InsertAssessmentState();
}

class _InsertAssessmentState extends State<InsertAssessmentPage> {
  KategoriAssessment? selectedCategory;
  Pendaftar? selectedPendaftar;
  Vmitra? selectedVmitra;
  bool _isLoading = false;
  String? categoryError;
  String? pendaftarError;
  String? vmitraError;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.Provider.of<KategoriAssessmentProviders>(
        context,
        listen: false,
      ).getKategoriAssessmentData();
      provider.Provider.of<PendaftarProviders>(
        context,
        listen: false,
      ).getPendaftarData();
      Future.microtask(
        () => provider.Provider.of<VmitraProviders>(
          context,
          listen: false,
        ).getVmitraData(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                size: 24,
                color: Colors.blue,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            const Text(
              'Penilaian Dosen',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: provider.Consumer3<KategoriAssessmentProviders, PendaftarProviders,
          VmitraProviders>(
        builder: (context, kategoriProvider, pendaftarProvider, vMitraProvider,
            child) {
          final kategoriAssessments = kategoriProvider.kategoriAssessments;
          final pendaftar = pendaftarProvider.pendaftars;
          final vMitras = vMitraProvider.vmitras;

          if (kategoriAssessments == null ||
              pendaftar == null ||
              vMitras == null) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: yellowPens,
                valueColor: AlwaysStoppedAnimation(bluePens),
              ),
            );
          }
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 16.0,
                  ),
                  child: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Kategori Assessment',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          CustomDropDown<KategoriAssessment>(
                            labelText: 'Kategori Assessment',
                            prefixIcon: Icons.category,
                            hintText: 'Pilih Kategori Assessment',
                            value: selectedCategory,
                            onChanged: (newValue) {
                              setState(() {
                                selectedCategory = newValue;
                                categoryError = null;
                              });
                            },
                            items: kategoriAssessments,
                            itemToString: (kategoriAssessment) =>
                                kategoriAssessment.kategoriAssessment ?? '',
                            error: categoryError,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Pendaftar',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          CustomDropDown<Pendaftar>(
                            labelText: 'Pendaftar',
                            prefixIcon: Icons.person,
                            hintText: 'Pilih Pendaftar',
                            value: selectedPendaftar,
                            onChanged: (newValue) {
                              setState(() {
                                selectedPendaftar = newValue;
                                pendaftarError = null;
                              });
                            },
                            items: pendaftar,
                            itemToString: (pendaftar) =>
                                pendaftar.mahasiswa ?? '',
                            error: pendaftarError,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Vmitra',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          CustomDropDown<Vmitra>(
                            labelText: 'Vmitra',
                            prefixIcon: Icons.person,
                            hintText: 'Pilih Vmitra',
                            value: selectedVmitra,
                            onChanged: (newValue) {
                              setState(() {
                                selectedVmitra = newValue;
                                vmitraError = null;
                              });
                            },
                            error: vmitraError,
                            items: vMitras,
                            itemToString: (vmitra) => vmitra.pic ?? '',
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Input Nilai',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          CustomForm(
                            hintText: 'Input Nilai',
                            controller: context
                                .read<InsertAssessmentProviders>()
                                .nilaiController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Mohon masukkan nilai';
                              }
                              // print(value);
                              return null;
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 16.0,
                ),
                child: SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: _isLoading
                        ? null
                        : () {
                            setState(() {
                              _isLoading = true;
                            });
                            if (selectedCategory == null ||
                                selectedPendaftar == null ||
                                selectedVmitra == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Mohon lengkapi semua field'),
                                ),
                              );
                              setState(() {
                                _isLoading = false;
                              });
                            } else {
                              context
                                  .read<InsertAssessmentProviders>()
                                  .postInsertNilaiAssessmentData(
                                    kategoriAssessment: selectedCategory!,
                                    pendaftar: selectedPendaftar!,
                                    vmitra: selectedVmitra!,
                                    nilai: context
                                        .read<InsertAssessmentProviders>()
                                        .nilaiController
                                        .text,
                                    onSuccess: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('Data berhasil disimpan'),
                                          backgroundColor: Colors.green,
                                        ),
                                      );
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      selectedCategory = null;
                                      selectedPendaftar = null;
                                      selectedVmitra = null;
                                      context
                                          .read<InsertAssessmentProviders>()
                                          .nilaiController
                                          .clear();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const VReadAssessmentPage(),
                                        ),
                                      );
                                    },
                                    onError: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Data gagal disimpan karena duplikasi',
                                          ),
                                          backgroundColor: Colors.amber,
                                        ),
                                      );
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    },
                                  );
                            }
                          },
                    child: _isLoading
                        ? const CircularProgressIndicator(
                            backgroundColor: yellowPens,
                            valueColor: AlwaysStoppedAnimation(bluePens),
                          )
                        : const Text(
                            'Simpan',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
