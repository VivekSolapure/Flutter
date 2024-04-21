import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  String x='';
  String y='';
  num z=0;

  final displayOneController= TextEditingController();
  final displayTwoController= TextEditingController();
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    displayOneController.text=x.toString();
    displayTwoController.text=y.toString();

    _listener=AppLifecycleListener(
      // onShow: _onShow,
      // onHide: _onHide,
      // onResume: _onResume,
      // onDetach: _onDetach,
      // onInactive: _onInactive,
      // onPause: _onPause,
      // onRestart: _onRestart,
      onStateChange: _onStateChange,
    );

  }

  // void _onShow()=>print('onShow called');
  // void _onHide()=>print('onHide called');
  // void _onResume()=>print('onResume called');
  // void _onDetach()=>print('onDetach called');
  // void _onInactive()=>print('onInactive called');
  // void _onPause()=>print('onPause called');
  // void _onRestart()=>print('onRestart called');
  void _onStateChange(AppLifecycleState state) {
    print('_onStateChange called: $state');

  }

  @override
  void dispose(){
    displayOneController.dispose();
    displayTwoController.dispose();
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          //display
          CalculatorDisplay (hint:'Enter First number',controller: displayOneController),
          const SizedBox(
            height: 30,
          ),
          CalculatorDisplay (hint:'Enter Second number',controller: displayTwoController),
          const SizedBox(
            height: 30,
          ),
           Text(
            z.toStringAsFixed(3),
            style: const TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold

            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
              onPressed:() {
                setState(() {
                  z= int.parse(displayOneController.text)!+
                      int.parse(displayTwoController.text)!;
                });

              },
              child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z= int.parse(displayOneController.text)!-
                       int.parse(displayTwoController.text)!;
                  });
                },

                child: const Icon(CupertinoIcons.minus),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z= int.parse(displayOneController.text)!*
                        int.parse(displayTwoController.text)!;
                  });
                },

                child: const Icon(CupertinoIcons.multiply),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z= int.parse(displayOneController.text)!/
                        int.parse(displayTwoController.text)!;
                  });
                },

                child: const Icon(CupertinoIcons.divide),
              ),

            ],
          ),
          const SizedBox(height: 10,),
          FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                z=0;
                displayTwoController.clear();
                displayOneController.clear();
              });
            },
            label: const Text('Clear'),

          ),
        ],
      ),
    );
  }
}

class CalculatorDisplay extends StatelessWidget {
  const CalculatorDisplay({
    super.key,
    this.hint="Enter a Number",
    required this.controller,
  });
  final String? hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller:controller,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
            color: Colors.black
        ),
        border :const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white,
                  width: 3,
              )
          ),

          focusedBorder : OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black12,
            width: 3
          ),
            borderRadius: BorderRadius.circular(10),

          ),

      ),
    );
  }
}
