import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormatsClass {
  static MaskTextInputFormatter phone() {
    return MaskTextInputFormatter(
      mask: '####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );
  }

  static MaskTextInputFormatter dui() {
    return MaskTextInputFormatter(
      mask: '########-#',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );
  }

  static MaskTextInputFormatter nit() {
    return MaskTextInputFormatter(
      mask: '####-######-###-#',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );
  }

  static MaskTextInputFormatter date() {
    return MaskTextInputFormatter(
      mask: '##-##-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );
  }
}
