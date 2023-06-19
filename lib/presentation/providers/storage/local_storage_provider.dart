import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastructure/datasources/isar_local_starage_datasource_impl.dart';
import '../../../infrastructure/repositories/local_storage_repository_impl.dart';

final localStorageRepositoryProvider = Provider((ref) {

  return LocalStorageRepositoryImplementation(IsarLocalStorageDataSourceImplementation());
});