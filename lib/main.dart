import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const login(),
    );
  }
}

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  var formkey = GlobalKey<FormState>();
  var isvalid = false;
  var isobscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://img.freepik.com/free-vector/desktop-smartphone-app-development_23-2148683810.jpg?w=740&t=st=1668679120~exp=1668679720~hmac=3dd717c59d8536759a93dce099c174b96f4310b2b220193b195616920be32868",
                width: 250,
              ),
              Text(
                'Hello devs!',
                style: TextStyle(
                  fontFamily: "poppins",
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'you\'ve been missed',
                style: TextStyle(
                  fontFamily: "poppins",
                  fontSize: 15,
                  color: Colors.grey.shade600,
                ),
              ),
              Form(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.white,
                          )),
                      child: TextFormField(
                        onChanged: (value) {
                          if (value.contains("@gmail.com")) {
                            setState(() {
                              isvalid = true;
                            });
                          } else {
                            setState(() {
                              isvalid = false;
                            });
                          }
                        },
                        validator: (value) {
                          if (value!.length < 6) {
                            return "Plese enter correct email address";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          suffixIcon: isvalid
                              ? Icon(
                                  Icons.done,
                                  color: Colors.deepPurple,
                                )
                              : null,
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.grey,
                          ),
                          border: InputBorder.none,
                          hintText: "email",
                          hintStyle: TextStyle(fontFamily: "poppins"),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.white,
                          )),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isobscure = !isobscure;
                                });
                              },
                              child: Icon(
                                Icons.remove_red_eye,
                                color:
                                    isobscure ? Colors.grey : Colors.deepPurple,
                              )),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                          border: InputBorder.none,
                          hintText: "password",
                          hintStyle: TextStyle(fontFamily: "poppins"),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'recover password',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontFamily: "poppins",
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (formkey.currentState!.validate()) {}
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.deepPurple,
                      ),
                      height: 50,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width - 80,
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: "poppins",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 12),
                    child: Row(
                      children: [
                        Expanded(child: Divider()),
                        Text(
                          'or continue with',
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:const [
                      Icon(
                        Icons.facebook,
                        size: 70,
                        color: Colors.deepPurple,
                      ),
                      Icon(
                        Icons.snapchat,
                        size: 70,
                        color: Colors.deepPurple,
                      ),
                      Icon(
                        Icons.telegram,
                        size: 70,
                        color: Colors.deepPurple,
                      ),
                      Icon(
                        Icons.email,
                        size: 70,
                        color: Colors.deepPurple,
                      ),
                      Icon(
                        Icons.phone_android,
                        size: 70,
                        color: Colors.deepPurple,
                      ),
                    ],
                  ),
                ],
              ))
            ],
          ),
        ),
      )),
    );
  }
}
