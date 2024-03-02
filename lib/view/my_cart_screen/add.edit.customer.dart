import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/helpers/helpers.dart';
import '../../models/models.dart';
import '../../utils/sizeconfig/sizeconfig.dart';

import '../../../../components/buttons.dart';
import '../../../../components/common_textfield.dart';
import '../../../../components/customappbar/custom_appbar.dart';
import '../../../../components/validation/validation.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/enstring/enstring.dart';
import '../../../../config/mediaquery/mediaquery.dart';
import '../../components/dropdown.dart';
import '../../controller/profile_controller/profile_controller.dart';

class AddEditCustomerScreen extends StatefulWidget {
  const AddEditCustomerScreen({Key? key}) : super(key: key);

  @override
  State<AddEditCustomerScreen> createState() => _AddEditCustomerScreenState();
}

class _AddEditCustomerScreenState extends State<AddEditCustomerScreen> {
  final ProfileController _profileController = Get.put(ProfileController());

  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.appBgColor,
        appBar: CustomAppBar(
          title: EnString.addCustumer,
          onPressed: () {
            Get.back();
          },
        ),
        body: Form(
          key: _form,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height / 50,
                ),
                _CascaronInputWidget(
                  child: CommonTextfield(
                    obscuretext: false,
                    hinttext: 'Nombre',
                    controller: _profileController.firstname,
                    validator: (value) {
                      return Validation.normalvalidation(
                          value: value, errortext: 'Por ingrese el nombre');
                    },
                    onchange: (value) {
                      String? val = Validation.normalvalidation(
                        value: value,
                        errortext: 'Por ingrese el nombre valido',
                      );
                      if (val == null) {
                        _profileController.setFirstValidation(true);
                      } else {
                        _profileController.setFirstValidation(false);
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                _CascaronInputWidget(
                  child: CommonTextfield(
                    obscuretext: false,
                    hinttext: 'Nombre del negocio',
                    controller: _profileController.negocio,
                    validator: (value) {
                      return Validation.normalvalidation(
                          value: value, errortext: 'Por ingrese el nombre');
                    },
                    onchange: (value) {
                      String? val = Validation.normalvalidation(
                        value: value,
                        errortext: 'Por ingrese el nombre valido',
                      );
                      if (val == null) {
                        _profileController.setFirstValidation(true);
                      } else {
                        _profileController.setFirstValidation(false);
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                _CascaronInputWidget(
                  child: CommonTextfield(
                    obscuretext: false,
                    hinttext: '########-#',
                    label: 'DUI',
                    controller: _profileController.dui,
                    inputFormatters: [
                      FormatsClass.dui(),
                    ],
                    validator: (value) {
                      return Validation.normalvalidation(
                          value: value, errortext: 'Por ingrese el DUI');
                    },
                    onchange: (value) {
                      String? val = Validation.normalvalidation(
                        value: value,
                        errortext: 'Por ingrese el DUI valido',
                      );
                      if (val == null) {
                        _profileController.setFirstValidation(true);
                      } else {
                        _profileController.setFirstValidation(false);
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                _CascaronInputWidget(
                  child: CommonTextfield(
                    obscuretext: false,
                    hinttext: '####-######-###-#',
                    label: 'NIT',
                    inputFormatters: [
                      FormatsClass.nit(),
                    ],
                    controller: _profileController.nit,
                    validator: (value) {
                      return Validation.normalvalidation(
                          value: value, errortext: 'Por ingrese el NIT');
                    },
                    onchange: (value) {
                      String? val = Validation.normalvalidation(
                        value: value,
                        errortext: 'Por ingrese el NIT valido',
                      );
                      if (val == null) {
                        _profileController.setFirstValidation(true);
                      } else {
                        _profileController.setFirstValidation(false);
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                _CascaronInputWidget(
                  child: CommonTextfield(
                    obscuretext: false,
                    hinttext: 'NRC',
                    controller: _profileController.nrc,
                    validator: (value) {
                      return Validation.normalvalidation(
                          value: value, errortext: 'Por ingrese el NRC');
                    },
                    onchange: (value) {
                      String? val = Validation.normalvalidation(
                        value: value,
                        errortext: 'Por ingrese el NRC valido',
                      );
                      if (val == null) {
                        _profileController.setFirstValidation(true);
                      } else {
                        _profileController.setFirstValidation(false);
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                _CascaronInputWidget(
                  child: SizedBox(
                    width: SizeConfig.kPadding400,
                    child: DropdownSearch<GiroItem>(
                      popupProps: const PopupProps.menu(
                        showSearchBox: true,
                        isFilterOnline: true,
                      ),
                      asyncItems: (String filter) async {
                        return await _profileController.getGiros(filter);
                      },
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "Giro",
                          hintText: "Seleccione un giro",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.indicatorGreyColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      itemAsString: (GiroItem item) => item.descripcion,
                      onChanged: (GiroItem? item) {
                        if (item != null) {
                          _profileController.giroSelected = item;
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                _CascaronInputWidget(
                  child: CommonTextfield(
                    obscuretext: false,
                    hinttext: '####-####',
                    label: 'Telefono celular',
                    controller: _profileController.telefono1,
                    inputFormatters: [
                      FormatsClass.phone(),
                    ],
                    validator: (value) {
                      return Validation.normalvalidation(
                          value: value,
                          errortext: 'Por ingrese el Telefono celular');
                    },
                    onchange: (value) {
                      String? val = Validation.normalvalidation(
                        value: value,
                        errortext: 'Por ingrese el Telefono celular valido',
                      );
                      if (val == null) {
                        _profileController.setFirstValidation(true);
                      } else {
                        _profileController.setFirstValidation(false);
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                _CascaronInputWidget(
                  child: CommonTextfield(
                    obscuretext: false,
                    hinttext: '####-####',
                    label: 'Telefono residencial',
                    controller: _profileController.telefono2,
                    inputFormatters: [
                      FormatsClass.phone(),
                    ],
                    validator: (value) {
                      return Validation.normalvalidation(
                          value: value,
                          errortext: 'Por ingrese el teléfono  residencial');
                    },
                    onchange: (value) {
                      String? val = Validation.normalvalidation(
                        value: value,
                        errortext: 'Por ingrese el teléfono residencial valido',
                      );
                      if (val == null) {
                        _profileController.setFirstValidation(true);
                      } else {
                        _profileController.setFirstValidation(false);
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                DropDownDemo(
                  chosenValue: _profileController.departamento,
                  data: [
                    ..._profileController.departamentos.map(
                      (e) => DropdowmItem(
                        id: e.idDepartamento,
                        title: e.nombre,
                      ),
                    )
                  ], //profileController.items,
                  hint: 'Departamento',
                  onchange: (p0) {
                    _profileController.departamento = p0;
                    _profileController.getMunicipalities(p0);
                    _profileController.municipio = null;
                  },
                ),
                SizedBox(
                  height: height / 50,
                ),
                DropDownDemo(
                  chosenValue: _profileController.municipio,
                  data: [
                    ..._profileController.municipalities.map(
                      (e) => DropdowmItem(
                        id: e.id,
                        title: e.nombre,
                      ),
                    )
                  ], // _profileController.items,
                  hint: 'Municipio',
                  onchange: (p0) {
                    _profileController.municipio = p0;
                  },
                ),
                SizedBox(
                  height: height / 50,
                ),
                _CascaronInputWidget(
                  child: CommonTextfield(
                    obscuretext: false,
                    hinttext: 'Dirección',
                    controller: _profileController.address,
                    validator: (value) {
                      return Validation.normalvalidation(
                          value: value, errortext: 'Por ingrese dirección');
                    },
                    onchange: (value) {
                      String? val = Validation.normalvalidation(
                        value: value,
                        errortext: 'Por ingrese dirección valida',
                      );
                      if (val == null) {
                        _profileController.setFirstValidation(true);
                      } else {
                        _profileController.setFirstValidation(false);
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: kIsWeb ? 0 : width / 20),
                  child: Center(
                    child: CommonTextfield(
                      obscuretext: false,
                      hinttext: 'Correo',
                      controller: _profileController.email,
                      validator: (value) {
                        return Validation.emailvalidation(
                            value: value,
                            errortext: 'Por favor ingrese un correo valido');
                      },
                      onchange: (value) {
                        String? val = Validation.emailvalidation(
                          value: value,
                          errortext: 'Por favor ingrese un correo valido',
                        );
                        if (val == null) {
                          _profileController.setEmailValidation(true);
                        } else {
                          _profileController.setEmailValidation(false);
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                _CascaronInputWidget(
                  child: CommonTextfield(
                    obscuretext: false,
                    hinttext: 'dd-mm-YYYY',
                    label: 'Fecha de nacimiento',
                    inputFormatters: [
                      FormatsClass.date(),
                    ],
                    controller: _profileController.fechaNamimiento,
                    validator: (value) {
                      return Validation.normalvalidation(
                          value: value,
                          errortext: 'Por ingrese la fecha de nacimiento');
                    },
                    onchange: (value) {
                      String? val = Validation.normalvalidation(
                        value: value,
                        errortext: 'Por ingrese la fecha de nacimiento',
                      );
                      return val;
                    },
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                _CascaronInputWidget(
                  child: CommonTextfield(
                    obscuretext: false,
                    hinttext: 'Dias de credito',
                    controller: _profileController.diasCredito,
                    validator: (value) {
                      return Validation.normalvalidation(
                          value: value, errortext: 'Por ingrese un valor');
                    },
                    onchange: (value) {
                      String? val = Validation.normalvalidation(
                        value: value,
                        errortext: 'Por ingrese un valor',
                      );
                      return val;
                    },
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                _CascaronInputWidget(
                  child: CommonTextfield(
                    obscuretext: false,
                    hinttext: 'Limite de credito',
                    controller: _profileController.limiteCredito,
                    validator: (value) {
                      return Validation.normalvalidation(
                          value: value, errortext: 'Por ingrese un valor');
                    },
                    onchange: (value) {
                      String? val = Validation.normalvalidation(
                        value: value,
                        errortext: 'Por ingrese un valor',
                      );
                      return val;
                    },
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                if (_profileController.loading.value)
                  const CircularProgressIndicator(),
                if (!_profileController.loading.value)
                  Buttons(
                    btnText: EnString.saveChange,
                    buttonColor: AppColors.lightBlueColor,
                    onTap: () {
                      if (_form.currentState!.validate()) {
                        // Get.back();
                        _profileController.saveCustomer();
                      }
                    },
                  ),
                SizedBox(
                  height: height / 14,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CascaronInputWidget extends StatelessWidget {
  const _CascaronInputWidget({required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: kIsWeb ? 0 : width / 20,
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
