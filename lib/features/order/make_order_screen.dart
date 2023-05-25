import 'package:flutter/material.dart';
import 'package:food_order/models/user_model.dart';
import 'package:food_order/common/app_styles.dart';

class MakeOrderScreen extends StatefulWidget {
  final Map<String, dynamic> food;
  const MakeOrderScreen({super.key, required this.food});

  @override
  State<MakeOrderScreen> createState() => _MakeOrderScreenState();
}

class _MakeOrderScreenState extends State<MakeOrderScreen> {
  final _formKey = GlobalKey<FormState>();
  final _user = User();
  String? _selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.primaryColor,
        title: const Text("Masukkan maklumat anda"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Builder(
          builder: (context) => Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: 'Name', hintText: 'Enter your full name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: 'Address', hintText: 'Enter your address'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your address';
                    }
                  },
                ),
                SwitchListTile(
                  title: const Text('Simpan Maklumat'),
                  value: _user.saveInfo,
                  onChanged: (bool value) => setState(() {
                    _user.saveInfo = value;
                  }),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                  child: const Text('Cara Pembayaran'),
                ),
                Column(
                  children: _user.paymentMethods.entries
                      .map(
                        (method) => RadioListTile(
                            title: Text(method.key),
                            value: method.key,
                            groupValue: _selectedPaymentMethod,
                            onChanged: (value) {
                              setState(() =>
                                  _selectedPaymentMethod = value as String);
                            }),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {
            final form = _formKey.currentState;
            if (form!.validate()) {
              form.save();
              _user.save();
              //_showDialog(context);
            }
          },
          child: const Text('Seterusnya'),
        ),
      ),
    );
  }
}
