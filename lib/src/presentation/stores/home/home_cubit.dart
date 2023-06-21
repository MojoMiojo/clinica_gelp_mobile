class HomeCubit {
  HomeCubit();

  final _nameRegEx = RegExp('([A-Za-z]+( [A-Za-z]+)+)');
  final _cpfRegEx = RegExp(
      '([0-9]{2}[.]?[0-9]{3}[.]?[0-9]{3}[/]?[0-9]{4}[-]?[0-9]{2})|([0-9]{3}[.]?[0-9]{3}[.]?[0-9]{3}[-]?[0-9]{2})');
  final _phoneRegEx = RegExp('([0-9]+( [0-9]+)+)');

  String? nameValidator(String? text) {
    if (text == null || text.isEmpty || !_nameRegEx.hasMatch(text)) {
      return 'Nome inválido';
    }
    return null;
  }

  String? phoneValidator(String? text) {
    if (text == null || text.isEmpty || !_phoneRegEx.hasMatch(text)) {
      return 'Telefone inválido';
    }
    return null;
  }

  String? cpfValidator(String? text) {
    if (text == null || text.isEmpty || !_cpfRegEx.hasMatch(text)) {
      return 'CPF inválido';
    }
    return null;
  }
}
