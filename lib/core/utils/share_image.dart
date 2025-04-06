import 'dart:io';
import 'package:share_plus/share_plus.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wall_paper_app/core/utils/toast.dart';

import '../base/logger/app_logger_impl.dart';

class ShareImage {

  Future<void> shareImage(String imageUrl, String userName) async {
    final filePath = await _downloadImage(imageUrl);
    if (filePath != null) {
      Share.shareXFiles([XFile(filePath)], text: 'Check out this image! from $userName');
    }
  }

  Future<String?> _downloadImage(String url) async {

    try {

      // Get temp directory
      final tempDir = await getTemporaryDirectory();

      // Create a unique file path
      final filePath = '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';

      // Download the image
      final response = await Dio().download(url, filePath);

      if (response.statusCode == 200) {
        log.d("Image downloaded to: $filePath");
        return filePath;
      } else {
        log.d("Failed to download image. Status: ${response.statusCode}");
      }
    } catch (e) {
      log.e("Error downloading image: $e");
    }

    return null;
  }

  Future<String?> saveImageLocally(String url) async {
    try {
      // Request permissions

      Directory? directory;

      if (Platform.isAndroid) {
        // Save to Downloads folder
        directory = Directory('/storage/emulated/0/Download');
        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory(); // fallback
        }
      } else if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      }

      if (directory == null) {
        log.d("Could not get storage directory.");
        return null;
      }

      final filePath = '${directory.path}/image_${DateTime.now().millisecondsSinceEpoch}.jpg';

      final response = await Dio().download(url, filePath);

      if (response.statusCode == 200) {
        log.d("Image saved to: $filePath");
        toast("Image saved to downloads!");
        return filePath;
      } else {
        log.d("Failed to save image. Status: ${response.statusCode}");
        toast("Image failed to save");
      }
    } catch (e) {
      log.e("Error saving image: $e");
      toast("Image failed to save");
    }

    return null;
  }
}


