import 'package:flutter/material.dart';
import 'package:olx_clone/filter/model/filter_model.dart';

class OrderByField extends StatelessWidget {
  final OrderBy initialValue;
  final FormFieldSetter<OrderBy> onSaved;

  OrderByField({this.initialValue, this.onSaved});

  @override
  Widget build(BuildContext context) {
    return FormField<OrderBy>(
      initialValue: initialValue,
      onSaved: onSaved,
      builder: (state) {
        return Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                state.didChange(OrderBy.DATE);
              },
              child: Container(
                alignment: Alignment.center,
                height: 45,
                width: 80,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: state.value == OrderBy.DATE
                        ? Colors.transparent
                        : Colors.grey,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  color: state.value == OrderBy.DATE
                      ? Colors.blue
                      : Colors.transparent,
                ),
                child: Text(
                  "Data",
                  style: TextStyle(
                    color: state.value == OrderBy.DATE
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            GestureDetector(
              onTap: () {
                state.didChange(OrderBy.PRICE);
              },
              child: Container(
                alignment: Alignment.center,
                height: 45,
                width: 80,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: state.value == OrderBy.PRICE
                        ? Colors.transparent
                        : Colors.grey,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  color: state.value == OrderBy.PRICE
                      ? Colors.blue
                      : Colors.transparent,
                ),
                child: Text(
                  "Preço",
                  style: TextStyle(
                    color: state.value == OrderBy.PRICE
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
