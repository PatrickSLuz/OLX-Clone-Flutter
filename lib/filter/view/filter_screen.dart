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
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _scrollController = ScrollController();

  Filter _filter = Filter(
    maxPrice: 1000,
    minPrice: 500,
    orderBy: OrderBy.PRICE,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                  initialValue: _filter.orderBy,
                  onSaved: (value) => _filter.orderBy = value,
                ),
                _buildLabel("Preço R\$"),
                PriceRangeField(
                  filter: _filter,
                ),
                _buildLabel("Tipo de anunciante"),
                VendorTypeField(
                  initialValue: _filter.vendorType,
                  onSaved: (value) => _filter.vendorType = value,
                ),
              ],
            ),
          ),
          AnimatedButton(
            scrollController: _scrollController,
            onTap: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();

                if (_filter.maxPrice != null && _filter.minPrice != null) {
                  if (_filter.minPrice > _filter.maxPrice) {
                    _scaffoldKey.currentState.showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.pink,
                        content: const Text("Faixa de preço inválida"),
                      ),
                    );
                    return;
                  }
                }

                // TODO, SALVAR E PESQUISAR
              }
            },
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
