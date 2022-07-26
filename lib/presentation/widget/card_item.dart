import 'package:flutter/material.dart';

import '../../business_logic/car_selection_cubit/cubit.dart';

Widget CardItem(BuildContext context, int index) {
  var cubit = CarCubit.get(context);

  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text(
        cubit.carName[index],
        style: const TextStyle(color: Colors.deepOrange),
      ),
      Checkbox(
        checkColor: Colors.white,
        fillColor: MaterialStateProperty.resolveWith(cubit.getColor),
        value: cubit.checkBoxVal[index],
        onChanged: (bool? value) {
          cubit.changeCheckBoxSelection(value, index);
          cubit.textFieldValue(index);
        },
      ),
    ],
  );
}
