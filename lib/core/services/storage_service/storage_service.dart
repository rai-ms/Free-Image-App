import 'package:hive_flutter/hive_flutter.dart';
import 'package:wall_paper_app/core/base/logger/app_logger_impl.dart';
import 'package:wall_paper_app/core/base/base_service/base_service.dart';
import 'package:wall_paper_app/core/services/storage_service/hive_constants.dart';
import 'package:wall_paper_app/core/utils/app_type_def.dart';

/// [StorageService] is Use to manage all the Storage related works in the app
/// It uses [HiveBoxName] where box names are defined
/// It uses [HiveConstants], where keys are store for any particular value
class StorageService implements BaseService<FVoid, String> {
  /// Singleton [service] is a singleton of [StorageService]
  static final StorageService service = StorageService();

  /// [authBox] saves all the auth related data
  static Box? authBox;

  /// [coreBox] saves all the core related data
  static Box? coreBox;

  /// [userResponseBox] saves all the user related data
  static Box? userResponseBox;

  /// Use to save the directory [path]
  String? path;

  // final Box<PackageResponseModel> cartBox = Hive.box<PackageResponseModel>('cartBox');


  static LazyBox? cartBox;

  @override
  FVoid init({String? param}) async {
    try {
      try{
        path = param;
      } catch(e){
        log.e("Error IN getApplicationDocumentsDirectory $e");
      }
      log.d("Path is $path");
      await Hive.initFlutter(path);
      await openBoxes();
    } catch (e) {
      log.e("Error IN storage init $e");
    }
    log.d("Storage Service init");
  }

  FVoid openBoxes() async {
    authBox = await Hive.openBox(HiveBoxName.authBox);
    coreBox = await Hive.openBox(HiveBoxName.appCoreBox);
    userResponseBox = await Hive.openBox(HiveBoxName.userResponseModel);
    cartBox=await Hive.openLazyBox(HiveBoxName.cartBox);
    log.d("Adapter Registered");
  }

  dynamic getAuth({required String key})  {
    return authBox?.get(key);
  }






  FVoid setAuth({required String key, required value}) async {
    return await authBox?.put(key, value).then((onValue) {
      log.d("Data Saved to hive: $key");
    }).onError((error, s) {
      log.e("Error Saving Data to Auth [$key]: $s - $error");
    });
  }

  FVoid setCore({required dynamic value, required String key}) async {
    try {
      await coreBox?.put(key, value);
    } catch (e) {
      log.e("Error Saving data to Core BOx $value");
    }
  }

  dynamic getCore({required String key}) {
    return coreBox?.get(key);
  }

  Future<int> clearAuth() async {
    return await authBox?.clear() ?? -1;
  }

  Future<int> clearCore() async {
    return await coreBox?.clear() ?? -1;
  }

  Future clearUser() async {
    return await userResponseBox?.delete(HiveConstants.user);
  }

}
