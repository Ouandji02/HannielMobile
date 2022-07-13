import 'package:flutter/material.dart';
import 'package:projet_flutter/rating/rating_view.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          alignment: Alignment.center,
          child: Column(
            children: [
              const FlutterLogo(
                size: 100,
              ),
              Text(
                "AWESOME APP",
                style: Theme.of(context).textTheme.headline3,
              ),
              Spacer(), //for space btw text n button
              TextButton.icon(
                onPressed: () {
                  openRatingDialog(context);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                  Colors.blue.withOpacity(0.1),
                )),
                icon: Icon(Icons.star),
                label: Text(
                  'Rate Us!',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  openRatingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: RatingView(),
        );
      },
    );
  }
}
