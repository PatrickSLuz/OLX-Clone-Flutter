import 'package:flutter/material.dart';
import 'package:olx_clone/filter/model/filter_model.dart';

class VendorTypeField extends StatelessWidget {
  final int initialValue;
  final FormFieldSetter<int> onSaved;

  VendorTypeField({this.initialValue, this.onSaved});

  @override
  Widget build(BuildContext context) {
    return FormField<int>(
      initialValue: initialValue,
      onSaved: onSaved,
      builder: (state) {
        return Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                if (state.value & VENDOR_TYPE_PARTICULAR != 0) {
                  if (state.value & VENDOR_TYPE_PROFESSIONAL != 0) {
                    // desabilitar a flag
                    state.didChange(state.value & ~VENDOR_TYPE_PARTICULAR);
                  } else {
                    state.didChange(VENDOR_TYPE_PROFESSIONAL);
                  }
                } else {
                  // habilitar a flag
                  state.didChange(state.value | VENDOR_TYPE_PARTICULAR);
                }
              },
              child: Container(
                alignment: Alignment.center,
                height: 45,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: state.value & VENDOR_TYPE_PARTICULAR != 0
                        ? Colors.transparent
                        : Colors.grey,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  color: state.value & VENDOR_TYPE_PARTICULAR != 0
                      ? Colors.blue
                      : Colors.transparent,
                ),
                child: Text(
                  "Particular",
                  style: TextStyle(
                    color: state.value & VENDOR_TYPE_PARTICULAR != 0
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            GestureDetector(
              onTap: () {
                if (state.value & VENDOR_TYPE_PROFESSIONAL != 0) {
                  if (state.value & VENDOR_TYPE_PARTICULAR != 0) {
                    // desabilitar a flag
                    state.didChange(state.value & ~VENDOR_TYPE_PROFESSIONAL);
                  } else {
                    state.didChange(VENDOR_TYPE_PARTICULAR);
                  }
                } else {
                  // habilitar a flag
                  state.didChange(state.value | VENDOR_TYPE_PROFESSIONAL);
                }
              },
              child: Container(
                alignment: Alignment.center,
                height: 45,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: state.value & VENDOR_TYPE_PROFESSIONAL != 0
                        ? Colors.transparent
                        : Colors.grey,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  color: state.value & VENDOR_TYPE_PROFESSIONAL != 0
                      ? Colors.blue
                      : Colors.transparent,
                ),
                child: Text(
                  "Profissional",
                  style: TextStyle(
                    color: state.value & VENDOR_TYPE_PROFESSIONAL != 0
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
