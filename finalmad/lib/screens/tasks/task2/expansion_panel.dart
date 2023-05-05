import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Item{
  Item({
    required this.headerText,
    required this.ExpansionText,
    this.isExpanded:false
});
  String headerText;
  String ExpansionText;
  bool isExpanded;
}


class expansion_panel extends StatefulWidget {
  const expansion_panel({Key? key}) : super(key: key);

  @override
  State<expansion_panel> createState() => _expansion_panelState();
}

class _expansion_panelState extends State<expansion_panel> {

  final List<Item> _data =List<Item>.generate(8, (int index) {
    return Item(
      headerText: "item ${index}",ExpansionText: 'description of item num $index');
  } );
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: (int index,bool isExpanded){
          setState(() {
            _data[index].isExpanded = !isExpanded;
          });
        },
        children: _data.map<ExpansionPanel>((Item item){
          return ExpansionPanel(
              headerBuilder: (BuildContext context ,bool isExpanded){
                return ListTile(
                  title: Text(item.headerText),
                );
              },
            body: ListTile(
              title: Text(item.ExpansionText),
              subtitle: Text("You can click on the icon but item will not be deleted"),
              trailing: const Icon(
                Icons.delete,
                color: Colors.redAccent,
              ),
              onTap: (){
                setState(() {
                  _data.removeWhere((Item currentItem) => item==currentItem);
                });
              },
            ),
              isExpanded: item.isExpanded,
              );
        }).toList() ,
      ),
    );
  }
}
