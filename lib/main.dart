// Alan Norcott
import 'package:flutter/material.dart';




void main() => runApp(const MyApp());




class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    const appTitle = 'Budgeting Questionnaire';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
          backgroundColor: Colors.green,
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}




class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);




  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}




class _MyCustomFormState extends State<MyCustomForm> {
  final expensesController = TextEditingController();
  final incomeController = TextEditingController();
  final spouseIncomeController = TextEditingController();




  bool isMarried = false;




  void handleSubmit() {
    int expenses = int.tryParse(expensesController.text) ?? 0;
    int income = int.tryParse(incomeController.text) ?? 0;
    int spouseIncome = int.tryParse(spouseIncomeController.text) ?? 0;
    int expectedBudget = income + spouseIncome - expenses;
    setState(() {});




    print('Expected budget: \$${expectedBudget}');
  }




  @override
  void dispose() {
    expensesController.dispose();
    incomeController.dispose();
    spouseIncomeController.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //https://www.youtube.com/watch?v=l-63nP4pISg
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Name: ',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Age: ',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: RichText(
            text: TextSpan(
              text: 'Are you currently employed?',
              style: DefaultTextStyle.of(context).style,
              children: const <TextSpan>[
                TextSpan(
                  text: ' (Select one of the options below)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Yes'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {},
                child: Text('No'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: RichText(
            text: TextSpan(
              text: 'Marital status?',
              style: DefaultTextStyle.of(context).style,
              children: const <TextSpan>[
                TextSpan(
                  text: ' (Select one of the options below)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isMarried = true;
                  });
                },
                child: Text('Married'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isMarried = false;
                  });
                },
                child: Text('Not married'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
              ),
            ],
          ),
        ),
        // https://stackoverflow.com/questions/54509688/how-to-add-a-widget-when-a-button-is-pressed-flutter
        if (isMarried)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: spouseIncomeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Spouse\'s Monthly Income (\$ USD)',
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: incomeController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Monthly Income (\$ USD)',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: expensesController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Monthly Expenses (\$ USD)',
            ),
          ),
        ),


        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: ElevatedButton(
            onPressed: handleSubmit,
            child: Text('Submit'),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Text(
            'Expected budget: \$${(int.tryParse(incomeController.text) ?? 0) + (int.tryParse(spouseIncomeController.text) ?? 0) - (int.tryParse(expensesController.text) ?? 0) }',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color:(int.tryParse(incomeController.text) ?? 0) + (int.tryParse(spouseIncomeController.text) ?? 0) - (int.tryParse(expensesController.text) ?? 0)  >= 0 ? Colors.green : Colors.red,
            ),
          ),
        ),
      ],
        ),
    );
  }
}
// Refrences
// https://stackoverflow.com/questions/69152342/how-to-change-text-color-based-on-its-result-using-flutter
// https://api.flutter.dev/flutter/widgets/RichText-class.html
//https://stackoverflow.com/questions/54509688/how-to-add-a-widget-when-a-button-is-pressed-flutter
// https://www.youtube.com/watch?v=l-63nP4pISg




