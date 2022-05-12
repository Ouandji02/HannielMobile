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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HANNIEL',
          style: TextStyle(
              fontSize: 20,
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 60,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 5),
                child: const Text(
                    "Ne parcourez plus les rues a la recherche d’un medicament, les hopitaux a larecherche d’un medecin.",
                    style: TextStyle(color: Colors.black45, fontSize: 16))),
            Container(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 5),
              child: const Text(
                'tout est dans ta poche',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 15),
              padding: const EdgeInsets.only(left: 10, right: 5),
              child: const Text(
                'Connectes toi pour profiter de l’experience',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Container(
              color: Colors.blueAccent,
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      width: width * .6,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
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
                        horizontal: 0, vertical: 5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 5),
                    width: width * .6,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const TextField(
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
                                color: Colors.blue),
                          ),
                        ),
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: width * .6,
                      margin: const EdgeInsets.only(
                        top: 15,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          child: FlatButton(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            onPressed: () {},
                            color: Colors.blueAccent,
                            child: const Text(
                              "Je me connecte",
                              style: TextStyle(
                                color: Colors.white,
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
                      margin: const EdgeInsets.only(top: 15),
                      child: const Text(
                        'Je suis nouveau, je n’ai pas de compe ?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
