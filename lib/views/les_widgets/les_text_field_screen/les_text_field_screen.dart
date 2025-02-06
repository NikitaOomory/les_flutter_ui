import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class LesTextFieldScreen extends StatefulWidget {
  @override
  State<LesTextFieldScreen> createState() => _LesTextFieldScreenState();
}

class _LesTextFieldScreenState extends State<LesTextFieldScreen> {

  final TextEditingController _myTextFieldController = TextEditingController();
  final TextEditingController _myBigTextFieldController = TextEditingController();
  DateTimeRange? _selectedDateRange; // Диапазон выбранных дат
  final String _textForDisableTextField = 'Васильев Никита Сергеевич';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            //обычный TextField
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: myTextField(_myTextFieldController),
            ),
            //большой TextFiled
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: myBigTextField(_myBigTextFieldController),
            ),
            //задизейбленный TextField с предвведённой информацией
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: myDisableTextField(_textForDisableTextField),
            ),
            //поиск
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: mySearchTextField(''),
            ),
            //дата пикер
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: () => _selectDateRange(context),
                child: InputDecorator(
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_selectedDateRange != null
                          ? '${DateFormat('dd.MM.yyyy').format(_selectedDateRange!.start)} - ${DateFormat('dd.MM.yyyy').format(_selectedDateRange!.end)}'
                          : 'Выберите диапазон дат'),
                      Icon(Icons.calendar_today, color: Colors.grey),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextField myTextField(TextEditingController controller) {
    return TextField(
      cursorColor: Colors.green,
      controller: controller, //контроллер для этого TextField
      decoration: InputDecoration(
        icon: Icon(Icons.account_balance_wallet_rounded, color: Colors.green, size: 40,),
        labelText: 'Сколько денег у Вас на счету?',
        labelStyle: TextStyle(color: Colors.grey.shade300),
        floatingLabelStyle: TextStyle(color: Colors.green),
        hintText: '10000',
        hintStyle: TextStyle(color: Colors.grey.shade300),
        maintainHintHeight: true, //hint в значении false будет по центру
        floatingLabelBehavior: FloatingLabelBehavior.auto, //можно включить или отключить анимацию перемещения label
        prefixIcon: Icon(Icons.monetization_on_outlined, color: Colors.green,),
        suffixText: 'руб.',
        suffixStyle: TextStyle(color: Colors.green),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      ),
      keyboardType: TextInputType.number, //тип клавиатуры вызываемый для поля
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly, //валидация
      ],
    );
  }

  TextField myBigTextField(TextEditingController controller){
    return  TextField(
      maxLines: 5,
      cursorColor: Colors.green,
      controller: controller, //контроллер для этого TextField
      decoration: InputDecoration(
        icon: Icon(Icons.contact_page_rounded, color: Colors.green, size: 40,),
        labelText: 'Опишите свою жизнь в пяти предложениях',
        labelStyle: TextStyle(color: Colors.grey.shade300),
        floatingLabelStyle: TextStyle(color: Colors.green),
        hintText: 'Я живу так...',
        hintStyle: TextStyle(color: Colors.grey.shade300),
        maintainHintHeight: true, //hint в значении false будет по центру
        floatingLabelBehavior: FloatingLabelBehavior.auto, //можно включить или отключить анимацию перемещения label
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      ),
    );
  }

  TextField myDisableTextField(String text){
    return TextField(
      controller: TextEditingController(text: text),
      readOnly: true,
      cursorColor: Colors.green,
      decoration: InputDecoration(
        icon: Icon(Icons.man, color: Colors.green, size: 40,),
        labelText: 'Автор',
        labelStyle: TextStyle(color: Colors.grey.shade300),
        floatingLabelStyle: TextStyle(color: Colors.green),
        maintainHintHeight: true, //hint в значении false будет по центру
        floatingLabelBehavior: FloatingLabelBehavior.auto, //можно включить или отключить анимацию перемещения label
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      ),
    );
  }

  TextField mySearchTextField(String query){
    return TextField(
      decoration: InputDecoration(
        hintText: 'Поиск...',
        hintStyle: TextStyle(color: Colors.grey.shade300),
        maintainHintHeight: true, //hint в значении false будет по центру
        floatingLabelBehavior: FloatingLabelBehavior.auto, //можно включить или отключить анимацию перемещения label
        prefixIcon: Icon(Icons.search, color: Colors.green,),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      ),
      onChanged: (query) {
        // _searchObjects(query); // Вызов метода поиска при изменении текста
      },
    );
  }

  Future<void> _selectDateRange(BuildContext context) async {
    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      initialDateRange: _selectedDateRange,
      firstDate: DateTime(2024),
      lastDate: DateTime(2101),
    );
  }

}
