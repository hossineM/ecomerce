import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
var obstext;
RegExp regixEmail = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
void validation() {
  final FormState? form = _formKey.currentState;
  if (form!.validate()) {
    print('yes');
  } else {
    print('no');
  }
}

class _SignUpState extends State<SignUp> {
  @override
  void initState() {
    obstext = true;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Container(
                child: Column(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'register',
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 400,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value != null && value.isNotEmpty) {
                              if (value.length < 6) {
                                return 'the user Name is too short';
                              }
                            } else if (value == '') {
                              return 'please fill the userName';
                            }
                            return '';
                          },
                          decoration: const InputDecoration(
                            hintText: 'User Name',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value != null && value.isNotEmpty) {
                              if (!regixEmail.hasMatch(value)) {
                                return 'the email is not valid please provide a correct one';
                              }
                            } else if (value == '') {
                              return 'please fill the email';
                            }
                            return '';
                          },
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        TextFormField(
                          obscureText: obstext,
                          validator: (value) {
                            if (value != null && value.isNotEmpty) {
                              if (value.length < 8) {
                                return 'the password is too short';
                              }
                            } else if (value == '') {
                              return 'please fill the password';
                            }
                            return '';
                          },
                          decoration: InputDecoration(
                              hintText: 'password',
                              border: OutlineInputBorder(),
                              suffixIcon: IconButton(
                                icon: obstext
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    obstext = !obstext;
                                  });
                                  print(obstext);
                                },
                              )),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value != null && value.isNotEmpty) {
                              if (value.length < 11) {
                                return 'the lenght must not be less than 11';
                              }
                            } else if (value == '') {
                              return 'please fill the phone number';
                            }
                            return '';
                          },
                          decoration: const InputDecoration(
                            hintText: 'Phone Number ',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        Container(
                          height: 45,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: validation,
                            child: Text('register '),
                          ),
                        ),
                        Row(
                          children: [
                            const Text('I have already an  account ! '),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              child: const Text(
                                'login',
                                style: TextStyle(
                                  color: Colors.cyan,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ]),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
