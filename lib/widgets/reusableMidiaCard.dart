import 'package:flutter/material.dart';

class ReusableMidiaCard extends StatelessWidget {
  const ReusableMidiaCard(
      {@required this.imageName,
      this.firstTextLine,
      this.secondTextLine,
      @required this.isChecked});

  final String imageName;
  final String firstTextLine;
  final String secondTextLine;
  final bool isChecked;

  bool containsFirstLine() {
    if (firstTextLine == null) return false;
    return true;
  }

  bool containsSecondLine() {
    if (secondTextLine == null) return false;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Stack(
        alignment: const Alignment(-0.8, 0.8),
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.all(
                Radius.circular(4.0),
              ),
            ),
            child: SizedBox(
              width: double.infinity,
              child: Image.asset(
                'assets/images/$imageName',
                fit: BoxFit.cover,
              ),
            ),
          ),
          !containsFirstLine()
              ? Container()
              : Container(
                  decoration: BoxDecoration(
                    color: Color(0x888EC397),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 5.0),
                    child: containsSecondLine()
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                firstTextLine,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                secondTextLine,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        : Text(
                            firstTextLine,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
          Positioned(
            child: !isChecked
                ? Container()
                : Icon(
                    Icons.check_circle,
                    color: Color(0xff5F9269),
                  ),
            right: 10,
            top: 10,
          ),
        ],
      ),
    );
  }
}
