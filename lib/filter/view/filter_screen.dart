import 'package:flutter/material.dart';
import 'package:olx_clone/filter/model/filter_model.dart';
import 'package:olx_clone/filter/widgets/animated_button.dart';
import 'package:olx_clone/filter/widgets/order_by_field.dart';
import 'package:olx_clone/filter/widgets/price_range_field.dart';
import 'package:olx_clone/filter/widgets/vendor_type_field.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filtar Busca"),
      ),
      body: Stack(
        children: <Widget>[
          Form(
            key: _formKey,
            child: ListView(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              children: <Widget>[
                _buildLabel("Ordenar por"),
                OrderByField(
                  initialValue: OrderBy.DATE,
                  onSaved: (value) {},
                ),
                _buildLabel("Preço R\$"),
                PriceRangeField(),
                _buildLabel("Tipo de anunciante"),
                VendorTypeField(
                  initialValue:
                      VENDOR_TYPE_PARTICULAR | VENDOR_TYPE_PROFESSIONAL,
                  onSaved: (newValue) {},
                ),
              ],
            ),
          ),
          AnimatedButton(
            scrollController: _scrollController,
            onTap: () {},
          )
        ],
      ),
    );
  }

  Widget _buildLabel(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.blue,
          fontSize: 13,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
