import 'package:flutter/material.dart';
import 'package:cloneapp/views/widgets/text_input_field.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:cloneapp/constants.dart';


class Signupscreen extends StatelessWidget {
  Signupscreen({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child:
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
        const SizedBox(height: 5),
        GradientText(
          'Sign Up',
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
        Stack(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png'),
              backgroundColor: Color.fromARGB(255, 196, 196, 196),
            ),

            // CircleAvatar(radius:50,
            //                     backgroundColor: Color.fromARGB(255, 196, 196, 196),
            //                     child: SizedBox(
            //                       width: 60,
            //                         height: 60,
            //                         child: ClipOval(
            //                           child: Image.asset("images/add_photo.png",
            //                             alignment:Alignment.topCenter,
            //                           ),
            //                         ),
            //                     ),),
            Positioned(
              bottom: -10,
              left: 60,
              child: IconButton(
                  onPressed:()=> authController.pickImage(),
                  icon: const Icon(
                    Icons.add_a_photo,
                    color: Color.fromARGB(186, 255, 65, 105),

                  )),
            )
          ],
        ),

        const SizedBox(height: 20),
        Container(
          width: MediaQuery
              .of(context)
              .size
              .width, //to get the width of screen
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: TextInputField(
            controller: _usernameController,
            labelText: 'Username',
            icon: Icons.person,
          ),
        ),
        const SizedBox(height: 15),
        Container(
          width: MediaQuery
              .of(context)
              .size
              .width, //to get the width of screen
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: TextInputField(
            controller: _emailController,
            labelText: 'Email',
            icon: Icons.email,
          ),
        ),
        const SizedBox(height: 15),
        Container(
          width: MediaQuery
              .of(context)
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
        const SizedBox(height: 20),
        Container(
          width: MediaQuery.of(context).size.width - 40, //to get the width of screen
          height: 50,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: InkWell(
              onTap: () =>
                  authController.registerUser(
                      _usernameController.text,
                      _emailController.text,
                      _passwordController.text,
                      authController.profilePhoto),
              child: Center(
          child: const Text('Register',
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
    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    const Text(
    'Already have an account?',
    style: TextStyle(
    fontSize: 20,
    fontFamily: 'WorkSans',
    fontWeight: FontWeight.w300,
    ),
    ),
    InkWell(
    onTap: () {
    print('login user');
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
    ]
    )
    )
    );
  }
}
