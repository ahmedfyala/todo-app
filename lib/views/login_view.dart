import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/firebase/firebase_functions.dart';
import 'package:todo/provider/login_provider.dart';
import 'package:todo/views/bottom_navigation_bar.dart';
import 'package:todo/views/sign_up_view.dart';

class LoginScreen extends StatelessWidget {
  static const String routName = "LoginScreen";
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<LoginProvider>(context);
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Column(
              children: [
                Text(
                  "Welcome Back",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Text("Enter your credential to login"),
              ],
            ),
            ////////////////////////////////////////////////////////
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: "Username",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none),
                      fillColor: Colors.purple.withOpacity(0.1),
                      filled: true,
                      prefixIcon: const Icon(Icons.person)),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none),
                    fillColor: Colors.purple.withOpacity(0.1),
                    filled: true,
                    prefixIcon: const Icon(Icons.password),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    FirebaseFunctions.loginUser(
                        emailController.text, passwordController.text,
                        onSuccess: (userName) {
                      pro.readUser();
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        BottomNavigationBarr.routName,
                        (route) => false,
                        arguments: pro.userModel?.userName,
                      );
                    }, onError: (error) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
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
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.purple,
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
            // //////////////////////////////////////////
            TextButton(
              onPressed: () {},
              child: const Text(
                "Forgot password?",
                style: TextStyle(color: Colors.purple),
              ),
            ),
            //////////////////////////////////////////////
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Dont have an account? "),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignUpView.routName);
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.purple),
                    ))
              ],
            ),
          ],
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