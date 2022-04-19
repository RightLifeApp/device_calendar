import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/material.dart';

class EventRemindersPage extends StatefulWidget {
  final List<Reminder> _reminders;

  EventRemindersPage(this._reminders, {Key? key}) : super(key: key);

  @override
  _EventRemindersPageState createState() => _EventRemindersPageState(_reminders);
}

class _EventRemindersPageState extends State<EventRemindersPage> {
  List<Reminder> _reminders = [];
  final _formKey = GlobalKey<FormState>();
  final _minutesController = TextEditingController();

  _EventRemindersPageState(List<Reminder> reminders) {
    _reminders = <Reminder>[...reminders];
  }

  @override
  void dispose() {
    _minutesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reminders'),
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _minutesController,
                      validator: (value) {
                        if (value == null || value.isEmpty || int.tryParse(value) == null) {
                          return 'Please enter a reminder time in minutes';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(labelText: 'Minutes before start'),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _reminders.add(Reminder(minutes: int.parse(_minutesController.text)));
                          _minutesController.clear();
                        });
                      }
                    },
                    child: Text('Add'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _reminders.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${_reminders[index].minutes} minutes'),
                  trailing: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _reminders.removeWhere((a) => a.minutes == _reminders[index].minutes);
                      });
                    },
                    child: Text('Delete'),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, _reminders);
            },
            child: Text('Done'),
          )
        ],
      ),
    );
  }
}
