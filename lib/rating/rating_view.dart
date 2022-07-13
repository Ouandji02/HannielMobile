import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RatingView extends StatefulWidget {
  const RatingView({Key? key}) : super(key: key);

  @override
  State<RatingView> createState() => _RatingViewState();
}

class _RatingViewState extends State<RatingView> {
  var _ratingpagecontroller = PageController();
  var _starPosition = 200.0;
  var _rating = 0;
  var _selectedchipindex = -1;
  var _ismoredatailactive = false;
  var _moredetailfocusnode = FocusNode();
  final _myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        //usedbc widget will be moving so it helps it move as a stack
        children: [
          //thanks note
          Container(
            height: max(
                300,
                MediaQuery.of(context).size.height *
                    0.3), //makes the container responsive
            child: PageView(
              controller: _ratingpagecontroller,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _buildThamksNote("saisie un text ici"),
                _causeOfRating(),
              ],
            ),
          ),
          //done button
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.green,
              child: MaterialButton(
                onPressed: _hidedialog,
                child: Text('Done'),
                textColor: Colors.white,
              ),
            ),
          ),
          //skip button
          // Positioned(
          // right: 0,
          //child: MaterialButton(
          // onPressed: _hidedialog,
          //child: Text('Skip'),
          //),
          //),
          //star rating
          AnimatedPositioned(
            top: _starPosition,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => IconButton(
                  icon: index < _rating
                      ? Icon(Icons.star, size: 32)
                      : Icon(Icons.star_border, size: 32),
                  color: Colors.yellow,
                  onPressed: () {
                    _ratingpagecontroller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease);
                    setState(() {
                      _numberofstar(index);
                    });
                  },
                ),
              ),
            ),
            duration: Duration(milliseconds: 300),
          ),
          //back button btw detail n normal view
          if (_ismoredatailactive)
            Positioned(
              left: 0,
              top: 0,
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    _ismoredatailactive = false;
                  });
                },
                child: Icon(Icons.arrow_back_ios),
              ),
            ),
        ],
      ),
    );
  }

  _buildThamksNote(message) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: TextStyle(
            fontSize: 26,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  _causeOfRating() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Visibility(
          visible: _ismoredatailactive,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('what could be better?'),
              //cause selection

              SizedBox(height: 16),
              //more button
              InkWell(
                onTap: () {
                  _moredetailfocusnode.requestFocus();
                  setState(() {
                    _ismoredatailactive = true;
                  });
                },
                child: Text(
                  'want to tell us more?',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          replacement: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Tell us more'),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _myController,
                ),
              ),
              FloatingActionButton(
                // When the user presses the button, show an alert dialog containing
                // the text that the user has entered into the text field.
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        // Retrieve the text the that user has entered by using the
                        // TextEditingController.
                        content: Text(_myController.text),
                      );
                    },
                  );
                },
                tooltip: 'Show me the value!',
                child: const Icon(Icons.text_fields),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _numberofstar(index) {
    _starPosition = 20.0;
    _rating = index + 1; //number of stars
    print(_rating);
  }

  _hidedialog() {
    if (Navigator.canPop(context)) Navigator.pop(context);
  }

  _getfield() {
    return TextField(
      controller: _myController,
    );
  }

}
