import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegisterFormPage extends StatefulWidget {
  const RegisterFormPage({Key? key}) : super(key: key);

  @override
  State<RegisterFormPage> createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterFormPage> {
  /// есть такой же готовый, но это вариант того, как создать своё ограничение
  /// с помощью регулярного выражения
  FilteringTextInputFormatter onlyDigits =
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]'));
  // FilteringTextInputFormatter onlyLatins =
  //     FilteringTextInputFormatter.allow(RegExp(r'[a-z]'));
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _lifeStoryController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _lifeStoryController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  bool _hidePass = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                validator: _validateName,
                // (value) =>
                //     value!.isEmpty ? "Name is required" : null,
                controller: _nameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  helperText: "Ivanov Ivan Ivanovich",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black38,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  suffixIcon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  prefixIcon: Icon(Icons.person),
                  labelText: "Full name *",
                  hintText: "Write your full name",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // TextFormField(
              //   validator: (value) =>
              //       // value!.isEmpty ? "Phone is required" : null,
              //       _validatePhone(value)
              //           ? null
              //           : 'Please enter digital phone number (###)### ## ##',
              //   controller: _phoneController,
              //   inputFormatters: [
              //     // onlyDigits,
              //     FilteringTextInputFormatter(RegExp(r'^[()\d -]{1,15}$'),
              //         allow: true),
              //   ],
              //   keyboardType: TextInputType.phone,
              //   decoration: const InputDecoration(
              //     helperText: "+X(XXX)XXX-XX-XX",
              //     focusedBorder: OutlineInputBorder(
              //       borderSide: BorderSide(
              //         color: Colors.blue,
              //       ),
              //       borderRadius: BorderRadius.all(
              //         Radius.circular(20.0),
              //       ),
              //     ),
              //     enabledBorder: OutlineInputBorder(
              //       borderSide: BorderSide(
              //         color: Colors.black38,
              //       ),
              //       borderRadius: BorderRadius.all(
              //         Radius.circular(20.0),
              //       ),
              //     ),
              //     suffixIcon: Icon(
              //       Icons.delete,
              //       color: Colors.red,
              //     ),
              //     prefixIcon: Icon(Icons.phone),
              //     labelText: "Phone number *",
              //     hintText: "Write your phone number",
              //   ),
              // ),
              TextFormField(
                // focusNode: _phoneFocus,
                // onFieldSubmitted: (_) {
                //   _fieldFocusChange(context, _phoneFocus, _passFocus);
                // },
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number *',
                  hintText: 'Where can we reach you?',
                  helperText: 'Phone format: (XXX)XXX-XXXX',
                  prefixIcon: const Icon(Icons.call),
                  suffixIcon: GestureDetector(
                    onLongPress: () {
                      _phoneController.clear();
                    },
                    child: const Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  // FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter(RegExp(r'^[()\d -]{1,15}$'),
                      allow: true),
                ],
                validator: (value) => _validatePhone(value!)
                    ? null
                    : 'Phone number must be entered as (###)###-####',
                // onSaved: (value) => newUser.phone = value!,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: _validateEmail,
                // (value) =>
                //     value!.isEmpty ? "email is required" : null,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  helperText: "address@domen.com",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black38,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  suffixIcon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  prefixIcon: Icon(Icons.email),
                  labelText: "email address *",
                  hintText: "Write your email address",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) =>
                    value!.isEmpty ? "address is required" : null,
                controller: _addressController,
                keyboardType: TextInputType.streetAddress,
                decoration: const InputDecoration(
                  helperText: "Tomsk",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  prefixIcon: Icon(Icons.location_city),
                  labelText: "Address *",
                  hintText: "Write your address as in passport",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                // validator: (value) =>
                //     value!.isEmpty ? "story is required" : null,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(100),
                ],
                controller: _lifeStoryController,
                maxLines: 3,
                decoration: const InputDecoration(
                  helperText:
                      "I was born in small town in a country side and liked to play in the garden with our aminals, such as goats, rabbits, horses and many others!",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black38,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  suffixIcon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  prefixIcon: Icon(Icons.text_fields),
                  labelText: "Life story",
                  hintText:
                      "Write some story about your habbits or sweet memories",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) =>
                    value!.isEmpty ? "password is required" : null,
                controller: _passwordController,
                obscureText: _hidePass,
                maxLength: 8,
                decoration: InputDecoration(
                  helperText:
                      "Minimum 8 characters, including at least 1 upper case, 1 one lower case, 1 digit and 1 special sign(_.!?@#\$%etc.)",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black38,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  suffixIcon: GestureDetector(
                    child: Icon(
                      _hidePass ? Icons.visibility : Icons.visibility_off,
                      // color: Colors.red,
                    ),
                    onTapDown: (details) {
                      setState(() {
                        _hidePass = false;
                      });
                    },
                    onTapUp: (details) {
                      setState(() {
                        _hidePass = true;
                      });
                    },
                    onLongPressDown: (details) {
                      setState(() {
                        _hidePass = false;
                      });
                    },
                    onLongPressUp: () {
                      setState(() {
                        _hidePass = true;
                      });
                    },
                    onLongPressCancel: () {
                      setState(() {
                        _hidePass = true;
                      });
                    },
                  ),
                  prefixIcon: Icon(Icons.password),
                  labelText: "Password *",
                  hintText: "Write password that you'll use to access",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) =>
                    value!.isEmpty ? "password is required" : null,
                controller: _confirmPasswordController,
                obscureText: _hidePass,
                maxLength: 8,
                decoration: InputDecoration(
                  helperText: "",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black38,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  suffixIcon: GestureDetector(
                    child: Icon(
                      _hidePass ? Icons.visibility : Icons.visibility_off,
                      // color: Colors.red,
                    ),
                    onTapDown: (details) {
                      setState(() {
                        _hidePass = false;
                      });
                    },
                    onTapUp: (details) {
                      setState(() {
                        _hidePass = true;
                      });
                    },
                    onLongPressDown: (details) {
                      setState(() {
                        _hidePass = false;
                      });
                    },
                    onLongPressUp: () {
                      setState(() {
                        _hidePass = true;
                      });
                    },
                    onLongPressCancel: () {
                      setState(() {
                        _hidePass = true;
                      });
                    },
                  ),
                  prefixIcon: Icon(Icons.password),
                  labelText: "Confirm password *",
                  hintText: "Repeat your password",
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green)),
                onPressed: () {
                  _submitForm();
                },
                child: Text(
                  "Confirm",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      debugPrint("Form is valid");
      debugPrint("Name: ${_nameController.text}");
      debugPrint("Phone number: ${_phoneController.text}");
      debugPrint("Email: ${_emailController.text}");
      debugPrint("Address: ${_addressController.text}");
      debugPrint("Life Story: ${_lifeStoryController.text}");
      // debugPrint("Password: ${_nameController.text}");
    } else {
      debugPrint("Form is not valid");
    }
  }

  String? _validateName(String? value) {
    final _nameExp = RegExp(r'^[a-zA-Z ]+$');

    if (value!.isEmpty) {
      return "Name is required";
    } else if (!_nameExp.hasMatch(value)) {
      return "Please enter alphabetical characters";
    } else {
      return null;
    }
  }

  bool _validatePhone(String input) {
    final _phoneExp = RegExp(r'^\(\d\d\d\)\d\d\d\-\d\d\d\d$');
    return _phoneExp.hasMatch(input);
  }

  String? _validateEmail(String input) {
    // final _emailExp = RegExp(r'^[a-zA-Z\d]+@[a-zA-Z\d.]+\.[a-zA-Z]{2,5}$');
    if (input.isEmpty) {
      return "Email can not be empty";
    } else if (!_emailController.text.contains('@')) {
      return "Not valid email";
    } else {
      return null;
    }
  }
}
