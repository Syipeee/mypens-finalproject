import 'package:get_it/get_it.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/datasource/delete_assessment_remote_datasource.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/datasource/insert_assessment_remote_datasource.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/datasource/kategori_assessment_remote_data_source.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/datasource/list_kegiatan_remote_data_source.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/datasource/list_vkegiatan_remote_data_source.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/datasource/pendaftar_remote_data_source.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/datasource/read_assessment_remote_data_source.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/datasource/read_vassessment_remote_data_source.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/datasource/update_assessment_remote_datasource.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/datasource/vmitra_remote_data_source.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/datasource/vpendaftar_remote_data_source.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/repository/delete_assessment_repository.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/repository/insert_nilai_assessment_repository.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/repository/kategori_assessment_repository.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/repository/list_kegiatan_repository.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/repository/list_vkegiatan_repository.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/repository/pendaftar_repository.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/repository/read_assessment_repository.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/repository/read_vassessment_repository.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/repository/update_assessment_repository.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/repository/vmitra_repository.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/repository/vpendaftar_repository.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/usecase/get_asssessment.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/usecase/get_kategori_assessment.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/usecase/get_list_kegiatan.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/usecase/get_list_vkegiatan.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/usecase/get_pendaftar.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/usecase/get_vassessment.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/usecase/get_vmitra.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/usecase/get_vpendaftar.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/usecase/post_assessment.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/usecase/post_del_assessment.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/data/domain/usecase/update_assessment.dart';

import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/providers/delete_assessment_providers.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/providers/kategori_assessment_providers.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/providers/list_kegiatan_providers.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/providers/insert_assessment_providers.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/providers/list_vkegiatan_providers.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/providers/pendaftar_providers.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/providers/read_assessment_providers.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/providers/read_vassessment_providers.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/providers/update_assessment_providers.dart';
import 'package:mypens/features/dosen/program_mbkm_dosen/presentation/providers/vmitra_providers.dart';

final locator = GetIt.instance;

void initInjection() {
  // datasource
  locator.registerLazySingleton<KategoriAssessmentRemoteDataSource>(
      () => KategoriAssessmentRemoteDataSourceImpl());
  locator.registerLazySingleton<InsertAssessmentRemoteDataSource>(
      () => InsertNilaiAssessmentRemoteDataSourceImpl());
  locator.registerLazySingleton<ListKegiatanResponseRemoteDataSource>(
      () => ListKegiatanResponseRemoteDataSourceImpl());
  locator.registerLazySingleton<ListVKegiatanResponseRemoteDataSource>(
      () => ListVKegiatanResponseRemoteDataSourceImpl());
  locator.registerLazySingleton<PendaftarRemoteDataSource>(
      () => PendaftarRemoteDataSourceImpl());
  locator.registerLazySingleton<VpendaftarRemoteDataSource>(
      () => VpendaftarRemoteDataSourceImpl());
  locator.registerLazySingleton<VmitraRemoteDataSource>(
      () => VmitraRemoteDataSourceImpl());
  locator.registerLazySingleton<ReadAssessmentRemoteDataSource>(
      () => ReadNilaiAssessmentRemoteDataSourceImpl());
  locator.registerLazySingleton<VReadAssessmentRemoteDataSource>(
      () => VReadNilaiAssessmentRemoteDataSourceImpl());
  locator.registerLazySingleton<UpdateAssessmentRemoteDataSource>(
      () => UpdateAssessmentRemoteDataSourceImpl());
  locator.registerLazySingleton<DeleteAssessmentRemoteDataSource>(
      () => DeleteAssessmentRemoteDataSourceImpl());

  // repository
  locator.registerLazySingleton<KategoriAssessmentRepository>(
      () => KategoriAssessmentRepositoryImpl(
            remoteDataSource: locator<KategoriAssessmentRemoteDataSource>(),
          ));
  locator.registerLazySingleton<InsertAssessmentRepository>(
      () => InsertNilaiAssessmentRepositoryImpl(
            remoteDataSource: locator<InsertAssessmentRemoteDataSource>(),
          ));
  locator.registerLazySingleton<ListKegiatanResponseRepository>(
      () => ListKegiatanResponseRepositoryImpl(
            remoteDataSource: locator<ListKegiatanResponseRemoteDataSource>(),
          ));
  locator.registerLazySingleton<ListVKegiatanResponseRepository>(
      () => ListVKegiatanResponseRepositoryImpl(
            remoteDataSource: locator<ListVKegiatanResponseRemoteDataSource>(),
          ));
  locator
      .registerLazySingleton<PendaftarRepository>(() => PendaftarRepositoryImpl(
            remoteDataSource: locator<PendaftarRemoteDataSource>(),
          ));
  locator.registerLazySingleton<VpendaftarRepository>(
      () => VpendaftarRepositoryImpl(
            remoteDataSource: locator<VpendaftarRemoteDataSource>(),
          ));
  locator.registerLazySingleton<VmitraRepository>(() => VmitraRepositoryImpl(
        remoteDataSource: locator<VmitraRemoteDataSource>(),
      ));
  locator.registerLazySingleton<ReadAssessmentRepository>(
      () => ReadAssessmentRepositoryImpl(
            remoteDataSource: locator<ReadAssessmentRemoteDataSource>(),
          ));
  locator.registerLazySingleton<VReadAssessmentRepository>(
      () => VReadAssessmentRepositoryImpl(
            remoteDataSource: locator<VReadAssessmentRemoteDataSource>(),
          ));
  locator.registerLazySingleton<UpdateAssessmentRepository>(
      () => UpdateAssessmentRepositoryImpl(
            remoteDataSource: locator<UpdateAssessmentRemoteDataSource>(),
          ));
  locator.registerLazySingleton<DeleteAssessmentRepository>(
      () => DeleteAssessmentRepositoryImpl(
            remoteDataSource: locator<DeleteAssessmentRemoteDataSource>(),
          ));

  // usecase
  locator.registerLazySingleton(() => GetKategoriAssessment(locator()));
  locator.registerLazySingleton(() => PostInsertAssessment(locator()));
  locator.registerLazySingleton(() => GetListKegiatanResponse(locator()));
  locator.registerLazySingleton(() => GetListVKegiatanResponse(locator()));
  locator.registerLazySingleton(() => GetPendaftar(locator()));
  locator.registerLazySingleton(() => GetVpendaftar(locator()));
  locator.registerLazySingleton(() => GetVmitra(locator()));
  locator.registerLazySingleton(() => GetReadAssessment(locator()));
  locator.registerLazySingleton(() => GetVReadAssessment(locator()));
  locator.registerLazySingleton(() => UpdateAssessment(locator()));
  locator.registerLazySingleton(() => DeleteAssessment(locator()));

  // provider
  locator.registerFactory(() => KategoriAssessmentProviders(
        getKategoriAssessment: locator(),
      ));
  locator.registerFactory(() => InsertAssessmentProviders(
        postInsertNilaiAssessment: locator(),
      ));
  locator.registerFactory(() => ListKegiatanProviders(
        getListKegiatanResponse: locator(),
      ));
  locator.registerFactory(() => ListVKegiatanProviders(
        getListVKegiatanResponse: locator(),
      ));
  locator.registerFactory(() => PendaftarProviders(
        getPendaftar: locator(),
      ));
  locator.registerFactory(() => VmitraProviders(
        getVmitra: locator(),
      ));
  locator.registerFactory(() => ReadAssessmentProviders(
        getReadAssessment: locator(),
      ));
  locator.registerFactory(() => VReadAssessmentProviders(
        getVReadAssessment: locator(),
      ));
  locator.registerFactory(() => UpdateAssessmentProvider(
        updateAssessment: locator(),
      ));
  locator.registerFactory(() => DeleteAssessmentProvider(
        deleteAssessment: locator(),
      ));
}
