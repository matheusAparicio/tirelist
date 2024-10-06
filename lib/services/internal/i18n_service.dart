import 'package:tirelist/utilities/languages.dart';

class I18nService {
  String? language;

  I18nService() {
    language = "ptBr";
  }

  String getLabel(String key) {
    switch (language) {
      case "ptBr":
        return Languages.ptBr[key] ?? '';
      default:
        return Languages.enUs[key] ?? '';
    }
  }
}
