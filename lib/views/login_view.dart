import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/firebase/firebase_functions.dart';
import 'package:todo/provider/login_provider.dart';
import 'package:todo/theme/app_colors.dart';
import 'package:todo/views/bottom_navigation_bar.dart';
import 'package:todo/views/sign_up_view.dart';

class LoginScreen extends StatelessWidget {
  static const String routName = "LoginScreen";
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var loginFormKey = GlobalKey<FormState>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<LoginProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundLightColor,
      body: SingleChildScrollView(
        child: Container(
          // margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Welcome Back",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  Text("Enter your credential to login"),
                ],
              ),
              ////////////////////////////////////////////////////////
              Form(
                key: loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Field Required";
                        }
                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-z]+\.[a-zA-Z]+")
                            .hasMatch(value);

                        if (!emailValid) {
                          return "please enter valid email";
                        }

                        return null;
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: "Email",
                          errorStyle: const TextStyle(
                            color: Colors.red,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none),
                          fillColor:
                              AppColors.primaryLightColor.withOpacity(0.2),
                          filled: true,
                          prefixIcon: const Icon(Icons.person)),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Field Required";
                        }

                        // bool validPassword = RegExp(
                        //         r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$")
                        //     .hasMatch(value);

                        // if (!validPassword) {
                        //   return "please enter valid password ";
                        // }
                        return null;
                      },
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: "Password",
                        errorStyle: const TextStyle(
                          color: Colors.red,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none),
                        fillColor: AppColors.primaryLightColor.withOpacity(0.2),
                        filled: true,
                        prefixIcon: const Icon(Icons.password),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: AppColors.primaryLightColor,
                      ),
                      onPressed: () {
                        if (loginFormKey.currentState!.validate()) {
                          FirebaseFunctions.loginUser(
                            emailController.text,
                            passwordController.text,
                            onSuccess: (userName) {
                              pro.readUser();
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                BottomNavigationBarr.routName,
                                (route) => false,
                                arguments: pro.userModel?.userName,
                              );
                            },
                            onError: (error) {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  backgroundColor:
                                      AppColors.backgroundLightColor,
                                  title: const Text("Error"),
                                  content: Text(error),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Okay"),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.secondaryDarkColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // //////////////////////////////////////////
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot password?",
                  style: TextStyle(
                    color: AppColors.primaryLightColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              //////////////////////////////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("don't have an account? "),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignUpView.routName);
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: AppColors.primaryLightColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// Scaffold(
//       appBar: AppBar(
//         title: const Text('Login'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: emailController,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'Username or Email',
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             TextField(
//               controller: passwordController,
//               obscureText: true,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'Password',
//               ),
//             ),
//             const SizedBox(height: 24.0),
//             ElevatedButton(
//               onPressed: () {
//                 FirebaseFunctions.loginUser(
//                   emailController.text,
//                   passwordController.text,
//                   onSuccess: (displayName) {
//                     Navigator.pushNamedAndRemoveUntil(
//                       context,
//                       BottomNavigationBarr.routName,
//                       (route) => false,
//                       arguments: displayName,
//                     );
//                   },
//                   onError: (error) {
//                     showDialog(
//                       context: context,
//                       builder: (context) => AlertDialog(
//                         title: const Text("Error"),
//                         content: Text(error),
//                         actions: [
//                           ElevatedButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             child: const Text("Okay"),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//               style: TextButton.styleFrom(
//                 backgroundColor: Colors.blue,
//                 padding: const EdgeInsets.symmetric(
//                     vertical: 12.0, horizontal: 24.0),
//               ),
//               child: const Text(
//                 'Login',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: InkWell(
//         onTap: () {
//           Navigator.pushNamed(context, SignUpView.routName);
//         },
//         child: Text(
//           "Don't Have an Account ? SingUp",
//           style: Theme.of(context).textTheme.titleLarge,
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );