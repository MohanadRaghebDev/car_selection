import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/car_selection_cubit/cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/car_selection_cubit/state.dart';

import '../../constants/constants.dart';
import '../widget/card_item.dart';

class CarSelection extends StatelessWidget {
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CarCubit(),
      child: BlocConsumer<CarCubit, CarState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = CarCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('نوع السيارة', style: carTypeTxtStyle),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              cubit.showCard();
                            },
                            child: const Text(
                              'تغيير',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            )),
                        const Spacer(),
                      ],
                    ),
                    TextFormField(
                      controller: controller,
                      decoration: InputDecoration(hintText: cubit.hintTextVal),
                    ),
                    if (cubit.showCardVal == true)
                      Card(
                        shadowColor: Colors.black12,
                        elevation: 5,
                        child: Container(
                          height: 150,
                          child: ListView.builder(
                            itemCount: cubit.carName.length,
                            itemBuilder: (context, index) =>
                                CardItem(context, index),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
