import 'package:excel/excel.dart';
import 'package:gelp_questionnaire/src/domain/excel_socioeconomic/use_case/save_excel_file_use_case.dart';

class CreateExcelFileUseCase {
  final SaveExcelUseCase _saveExcelUseCase;

  CreateExcelFileUseCase(this._saveExcelUseCase);

  void call({
    required String fileName,
    required Map<String, String> answersMap,
  }) {
    const defaultSheetName = 'Sheet1';
    var excel = Excel.createExcel();
    var rowIndex = 1;

    Sheet sheetObject = excel[defaultSheetName];

    answersMap.forEach((key, value) {
      createCell(
        sheetObject: sheetObject,
        value: key,
        columnIndex: 1,
        rowIndex: rowIndex,
      );
      createCell(
        sheetObject: sheetObject,
        value: value,
        columnIndex: 2,
        rowIndex: rowIndex,
      );
      rowIndex++;
    });

    excel.toString();
    var isSuccess = _saveExcelUseCase.call(fileName, excel);
    isSuccess.then((value) => print(value));
  }

  void createCell({
    required Sheet sheetObject,
    required String value,
    required int columnIndex,
    required int rowIndex,
  }) {
    final cellStyle = CellStyle();
    cellStyle.underline = Underline.Single;

    var cell = sheetObject.cell(
      CellIndex.indexByColumnRow(columnIndex: columnIndex, rowIndex: rowIndex),
    );

    cell.value = value; // dynamic values support provided;
    cell.cellStyle = cellStyle;
  }
}
