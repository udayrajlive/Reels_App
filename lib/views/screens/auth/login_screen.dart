import 'package:cloneapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloneapp/views/widgets/text_input_field.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(

            alignment: Alignment.center,
            child: Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  GradientText(
                    'InShOt Clone',
                    style: const TextStyle(
                      fontSize: 35,
                      fontFamily: 'WorkSans',
                      fontWeight: FontWeight.w800,
                    ),
                    colors: const [
                      Color(0xFFFF3C7D),
                      Color(0xFFFF4944),

                    ],
                  ),
                  const SizedBox(height:5),
                  GradientText(
                    'Login',
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'WorkSans',
                      fontWeight: FontWeight.w300,
                    ),
                    colors: const [
                      Color(0xFFFF4944),
                      Color(0xFFFF3C7D),
                    ],
                  ),
                  const SizedBox(height: 10),

              Container(
                width: MediaQuery.of(context)
                    .size
                    .width, //to get the width of screen
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _emailController,
                  labelText: 'Email',
                  icon: Icons.email,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context)
                    .size
                    .width, //to get the width of screen
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _passwordController,
                  labelText: 'Password',
                  icon: Icons.lock,
                  isObscure: true,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: MediaQuery.of(context).size.width -
                    40, //to get the width of screen
                height: 50,
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: InkWell(
                  onTap: () =>authController.LoginUser(
                  _emailController.text,
                  _passwordController.text),
                  child: Center(
                    child: const Text('Login',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'WorkSans',
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                height: 24,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                  const Text(
                    'Don’t have an account?',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'WorkSans',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      print('register user');
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'WorkSans',
                        color: buttonColor,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  )
                ]),
              )
            ])));
  }
}
