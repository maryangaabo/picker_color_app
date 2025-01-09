import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<Color> colorst = [
    Colors.cyan,
    Colors.orange,
    Colors.deepPurple,
    Colors.blue,
    Colors.pink,
  ];
  Color selectcolor = Colors.orange;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: selectcolor,
        title: const Text("picker app"),
        elevation: 31,
        centerTitle: true,
      ),
      body: Column(children: [
        Container(
          width: double.infinity,
          height: 280,
          color: selectcolor,
        ),
        SizedBox(
          height: 20,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              colorst.length,
              (index) {
                if (index == colorst.length - 1) {
                  return ColorCard(
                    islest: true,
                    isSeclected: selectcolor == colorst[index],
                    ontap: () {
                      showDialog(
                          context: context,
                          builder: (_) => SingleChildScrollView(
                                child: AlertDialog(
                                  title: Text("Chose color"),
                                  content: ColorPicker(
                                    pickerColor: selectcolor,
                                    onColorChanged: (Color) {
                                      selectcolor = Color;
                                      setState(() {});
                                    },
                                  ),
                                ),
                              ));
                    },
                    colors: colorst[index],
                  );
                } else {
                  return ColorCard(
                    isSeclected: selectcolor == colorst[index],
                    ontap: () {
                      selectcolor = colorst[index];

                      setState(() {});
                    },
                    colors: colorst[index],
                  );
                }
              },
            ))
      ]),
    );
  }
}

class ColorCard extends StatelessWidget {
  ColorCard({
    super.key,
    required this.colors,
    this.ontap,
    this.isSeclected = false,
    this.islest = false,
  });

  final Color colors;
  final bool isSeclected;
  final bool islest;

  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(color: colors, shape: BoxShape.circle),
          child: islest
              ? Icon(
                  Icons.collections,
                  color: Colors.white,
                )
              : isSeclected
                  ? Icon(
                      Icons.check,
                      color: Colors.white,
                    )
                  : null),
    );
  }
}
