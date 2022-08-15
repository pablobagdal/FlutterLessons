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

  bool _hidePass = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Form(
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              SizedBox(
                height: 15,
              ),
              TextField(
                // doesn't work. just lock the input at all
                // inputFormatters: [
                //   onlyLatins,
                // ],
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
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
              SizedBox(
                height: 10,
              ),

              /// TextFormField - это обёртка над TextField и представляет тот же
              /// функционал + функции рестарт, валидация и другие
              TextFormField(
                inputFormatters: [
                  onlyDigits,
                ],
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  helperText: "+X(XXX)XXX-XX-XX",
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
                  prefixIcon: Icon(Icons.phone),
                  labelText: "Phone number *",
                  hintText: "Write your phone number",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
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
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.streetAddress,
                decoration: InputDecoration(
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
              SizedBox(
                height: 10,
              ),
              TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
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
              SizedBox(
                height: 10,
              ),
              TextFormField(
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
              SizedBox(
                height: 10,
              ),
              TextFormField(
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
              SizedBox(
                height: 15,
              ),
              TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green)),
                onPressed: () {},
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
}
