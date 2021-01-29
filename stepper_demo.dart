import 'package:flutter/material.dart';
class StepperDemoWidget extends StatefulWidget {
  @override
  _StepperDemoWidgetState createState() => _StepperDemoWidgetState();
}

class _StepperDemoWidgetState extends State<StepperDemoWidget> {
  int _currentStep = 0;
  StepperType _stepperType = StepperType.vertical;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stepper Demo"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child:
            Stepper(
              type: _stepperType,
              currentStep: _currentStep,
              physics: ScrollPhysics(),
              onStepTapped: (step) => tapped(step),
              onStepContinue: continued,
              onStepCancel: canceled,
              steps: <Step>[
                  Step(
                    title: Text("Hesap İşlemleri"),
                    content: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Eposta Adresi'
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Şifre'
                          ),
                        ),
                      ],
                    ),
                    isActive: _currentStep >=0,
                    state: _currentStep >=0 ? StepState.complete: StepState.disabled
                  ),
                Step(
                    title: Text("Adres Bilgileri"),
                    content: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Adres'
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Posta Kodu'
                          ),
                        ),
                      ],
                    ),
                    isActive: _currentStep >=0,
                    state: _currentStep >=1 ? StepState.complete: StepState.disabled
                ),
                Step(
                    title: Text("Telefon"),
                    content: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Cep Telefonu'
                          ),
                        ),

                      ],
                    ),
                    isActive: _currentStep >=0,
                    state: _currentStep >=2 ? StepState.complete: StepState.disabled
                ),
              ],
            )),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.list),
        onPressed: switchStepsType,
      ),

    );
  }

  tapped(int step) {
    setState(() {
      _currentStep = step;
    });
  }


  void continued() {
    _currentStep <2 ?
        setState(()=> _currentStep+=1) : null;
  }

  void canceled() {
    _currentStep >0 ?
    setState(()=> _currentStep-=1) : null;
  }

  void switchStepsType() {
    setState(() {
      _stepperType == StepperType.vertical
          ? _stepperType = StepperType.horizontal
          : _stepperType = StepperType.vertical;
    });
  }
}


