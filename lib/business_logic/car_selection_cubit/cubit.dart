import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/car_selection_cubit/state.dart';

class CarCubit extends Cubit<CarState> {
  CarCubit() : super(CarInitial());

  static CarCubit get(context) => BlocProvider.of(context);

  bool isChecked = false;
  bool showCardVal = false;
  List<String> carName = [
    'هيونداي',
    'بي واي دي ',
    'نيسان',
  ];
  List<bool> checkBoxVal = [
    false,
    false,
    false,
  ];
  String? hintTextVal;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.deepOrange;
  }

  void changeCheckBoxSelection(var val, index) {
    checkBoxVal[index] = val;
    emit(ChangeCheckBoxSelection());
  }

  void textFieldValue(int index) {
    hintTextVal = carName[index];
    print(hintTextVal);
    emit(TextFieldValueChange());
  }

  void showCard() {
    showCardVal = !showCardVal;
    emit(ShowCard());
  }
}
