import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:olx_clone/filter/model/filter_model.dart';
import 'package:olx_clone/utils/format_field.dart';

class PriceRangeField extends StatelessWidget {
  final Filter filter;

  PriceRangeField({this.filter});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextFormField(
            initialValue: filter.minPrice?.toString(),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Min",
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: false),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              RealInputFormatter(centavos: false),
            ],
            onSaved: (value) {
              if (value.isEmpty) {
                filter.minPrice = null;
              } else {
                filter.minPrice = int.tryParse(getSanitizedText(value));
              }
            },
            validator: (value) {
              if (value.isNotEmpty &&
                  int.tryParse(getSanitizedText(value)) == null) {
                return "Utilize valores válidos";
              }
              return null;
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextFormField(
            initialValue: filter.maxPrice?.toString(),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Max",
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: false),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              RealInputFormatter(centavos: false),
            ],
            onSaved: (value) {
              if (value.isEmpty) {
                filter.maxPrice = null;
              } else {
                filter.maxPrice = int.tryParse(getSanitizedText(value));
              }
            },
            validator: (value) {
              if (value.isNotEmpty &&
                  int.tryParse(getSanitizedText(value)) == null) {
                return "Utilize valores válidos";
              }
              return null;
            },
          ),
        )
      ],
    );
  }
}
