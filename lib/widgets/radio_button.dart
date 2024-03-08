import 'package:flutter/material.dart';
import 'package:phuchung_63130476/widgets/wrapper_data.dart';

class MyGroupRadio extends StatefulWidget {
  List<String> labels;
  StringWrapper groupValue;
  bool? isHorizontal;
  MyGroupRadio({required this.labels, required this.groupValue,
    this.isHorizontal=true, super.key});


  @override
  State<MyGroupRadio> createState() => _MyGroupRadioState();
}

class _MyGroupRadioState extends State<MyGroupRadio> {
  @override
  Widget build(BuildContext context) {
    if(widget.isHorizontal == true)
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _buildListRadio(),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _buildListRadio(),
    );
  }
  _buildListRadio(){
    return widget.labels.map(
            (label) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio(value: label,
                      groupValue: widget.groupValue.value,
                      onChanged: (value){
                        setState(() {
                          widget.groupValue.value = value;
                        });
                      }
                ),
                Text(label),
              ],
            )
    ).toList();
  }
}


