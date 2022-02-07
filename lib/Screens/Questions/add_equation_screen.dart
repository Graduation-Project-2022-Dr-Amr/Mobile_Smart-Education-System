import 'package:flutter/material.dart';
import 'package:login_signin/Screens/Questions/symbols.dart';
import 'package:login_signin/shared/constants/size_config.dart';

class AddQuestionScreen extends StatefulWidget {
  const AddQuestionScreen({Key? key}) : super(key: key);

  @override
  _AddQuestionScreenState createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  FocusNode inputFocusNode = FocusNode();
  TextEditingController inputController = TextEditingController();
  List<String> equations = [];
  bool _showFooter = false;

  @override
  void initState() {
    super.initState();
    inputFocusNode.addListener(() => _toggleFooterShowState());
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Equation'),
        actions: [IconButton(onPressed: _addEquation, icon: Icon(Icons.check))],
      ),
      bottomSheet:
          _showFooter ? _Footer(onSymbolClicked: _onSymbolClicked) : null,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          height: SizeConfig.screenHeight,
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              ...equations.map((e) => EquationHolder(equation: e)).toList(),
              TextFormField(
                onChanged: (s) {
                  try {
                    if (s.isNotEmpty && int.parse(s.characters.last) < 10) {
                      // inputController.text += ' ';
                      _moveCursorToEnd();
                    }
                  } on Exception catch (e) {
                    print(e);
                  }
                },
                enableSuggestions: false,
                controller: inputController,
                focusNode: inputFocusNode,
                keyboardType: TextInputType.number,
              )
            ]),
          ),
        ),
      ),
    );
  }

  void _toggleFooterShowState() {
    setState(() => _showFooter = !_showFooter);
    print(_showFooter);
  }

  _onSymbolClicked(String symbol) {
    inputController.text += ' $symbol ';
    _moveCursorToEnd();
  }

  _moveCursorToEnd() {
    inputController.selection = TextSelection.fromPosition(
        TextPosition(offset: inputController.text.length));
  }

  void _addEquation() {
    setState(() {
      equations.add(inputController.text);
    });
    inputController.text = '';
  }
}

class EquationHolder extends StatelessWidget {
  const EquationHolder({Key? key, required this.equation}) : super(key: key);
  final String equation;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(8)),
      width: double.infinity,
      child: Text(equation),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({Key? key, required this.onSymbolClicked}) : super(key: key);
  final OnSymbolClicked onSymbolClicked;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: 50,
      color: Colors.grey.shade100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: symbols.length,
          shrinkWrap: true,
          itemBuilder: (ctx, index) => Container(
                width: SizeConfig.screenWidth / 12,
                height: 50,
                decoration: BoxDecoration(
                    border: BorderDirectional(
                        end:
                            BorderSide(width: 1, color: Colors.grey.shade300))),
                child: InkWell(
                    onTap: () => onSymbolClicked(symbols[index]),
                    child: Center(
                        child: Text('${symbols[index]}',
                            style: TextStyle(fontSize: 16)))),
              )),
    );
  }
}

typedef OnSymbolClicked(String symbol);
