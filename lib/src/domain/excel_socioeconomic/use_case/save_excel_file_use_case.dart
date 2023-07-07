import 'dart:io';

import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';

class SaveExcelUseCase {
  Future<bool> call(String fileName, Excel excel) async {
    var fileBytes = excel.save(fileName: fileName);
    var directory = await getApplicationDocumentsDirectory();
    var file = File('$directory/$fileName');

    if (fileBytes == null) {
      return false;
    }

    file
      ..createSync(recursive: true)
      ..writeAsBytesSync(fileBytes);

    return true;
  }
}
