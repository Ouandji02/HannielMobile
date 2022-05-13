import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double width = MediaQuery.of(context).size.width;
    double heigth = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HANNIEL',
          style: TextStyle(
              fontSize: 30,
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 50,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 10),
          color: Colors.white,
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 5),
                  child: const Text(
                      "Ne parcourez plus les rues a la recherche d’un medicament, les hopitaux a la recherche d’un medecin.",
                      style: TextStyle(color: Colors.black45, fontSize: 18))),
               Container(
                 margin: EdgeInsets.only(left: 10),
                 child:Align(
                   alignment: Alignment.centerLeft,
                   child: const Text(
                     'Tout est dans ta poche',
                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                   ),
                 ),
               ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 40),
                padding: const EdgeInsets.only(left: 10, right: 5),
                child: const Text(
                  'Connectes toi pour profiter de l’experience',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Container(
                height: heigth * 0.65,
                padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                      color: Colors.blueAccent.withOpacity(1),
                      offset: Offset(0,-1),
                        blurRadius: 0,
                        spreadRadius: 3
                    )
                    ]
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          width: width * .8,
                          height: heigth * .08,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12.withOpacity(0.2),
                                offset: Offset(0,-3),
                                blurRadius: 7,
                                spreadRadius: 3
                              )
                            ]
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.person,
                                color: Colors.black38,
                              ),
                              hintText: "Enter your Email",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        width: width * .8,
                        height: heigth * .08,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12.withOpacity(0.2),
                                  offset: Offset(0,-3),
                                  blurRadius: 7,
                                  spreadRadius: 3
                              )
                            ]
                        ),
                        child:  const TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.lock,
                              color: Colors.black38,
                            ),
                            hintText: "Enter your password",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      // Ici j'affiche le texte pour le mot de passe oublie
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              margin: const EdgeInsets.only(right: 45),
                              child: const Text(
                                "J'ai oublie mon mot de passe !",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                      Center(
                        child: Container(
                          width: width * .8,
                          margin: const EdgeInsets.only(
                            top: 25,
                          ),
                          padding: EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12.withOpacity(0.1),
                                blurRadius: 7,
                                spreadRadius: 3
                              )
                            ]
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Je me connecte",
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 25),
                          child: const Text(
                            'Je suis nouveau, je n’ai pas de compe ?',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ) ,
            ],
          ),
        ),
      ),
    );
  }
}
