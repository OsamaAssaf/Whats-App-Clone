import 'package:flutter/material.dart';
import 'package:whats_app_clone/shared/components/constants.dart';
import 'package:whats_app_clone/shared/styles/colors.dart';
import 'package:whats_app_clone/shared/styles/styles.dart';

class CountryListLayout extends StatefulWidget {
  const CountryListLayout({Key? key}) : super(key: key);

  @override
  CountryListLayoutState createState() => CountryListLayoutState();
}

class CountryListLayoutState extends State<CountryListLayout> {
  double animatedContainerWidth = 0;
  double animatedContainerHeight = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: greyColor),
                    splashRadius: 20.0,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  title: Text(
                    'Choose a country',
                    style: darkGreenTitleStyle,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.search, color: greyColor),
                    splashRadius: 20.0,
                    onPressed: () {
                      setState(() {
                        animatedContainerHeight = 48.0;
                        animatedContainerWidth = MediaQuery.of(context).size.width;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: countryList.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      String code = countryList[index]['code']!.toLowerCase();
                      String imagePath = 'assets/flags/$code.png';
                      return ListTile(
                        leading: Image.asset(
                          imagePath,
                          width: 30,
                          height: 25,
                        ),
                        title: Text(
                          countryList[index]['name']!,
                          style: tileTitleStyle,
                        ),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                countryList[index]['dialCode']!,
                                style: tileTrailingStyle,
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Icon(
                                Icons.done,
                                color: darkGreenColor,
                                size: 24,
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop(code);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: animatedContainerWidth,
              height: animatedContainerHeight,
              curve: Curves.easeOutSine,
              child: Card(
                child: TextField(
                  decoration: InputDecoration(
                    prefix: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: greyColor,
                      ),
                      onPressed: () {
                        setState(() {
                          animatedContainerWidth = 0;
                          animatedContainerHeight = 0;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
