/// A calendar on the user's device
class Calendar {
  /// Read-only. The unique identifier for this calendar
  String? id;

  /// The name of this calendar
  String? name;

  /// Read-only. If the calendar is read-only
  bool? isReadOnly;

  /// Read-only. If the calendar is the default
  bool? isDefault;

  /// Read-only. Color of the calendar
  int? color;

  /// Read-only. Account name associated with the calendar
  String? accountName;

  /// Read-only. Account type associated with the calendar
  String? accountType;

  /// Read-only. Is it possible to add an event participant in this calendar
  bool? canAddAttendees;

  /// Read-only. Indicates whether the invitation is guaranteed to be sent to participants
  bool? possibleAttendeeProblems;

  Calendar({
    this.id,
    this.name,
    this.isReadOnly,
    this.isDefault,
    this.color,
    this.accountName,
    this.accountType,
    this.canAddAttendees,
    this.possibleAttendeeProblems,
  });

  Calendar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isReadOnly = json['isReadOnly'];
    isDefault = json['isDefault'];
    color = json['color'];
    accountName = json['accountName'];
    accountType = json['accountType'];
    canAddAttendees = json['canAddAttendees'];
    possibleAttendeeProblems = json['possibleAttendeeProblems'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'id': id,
      'name': name,
      'isReadOnly': isReadOnly,
      'isDefault': isDefault,
      'color': color,
      'accountName': accountName,
      'accountType': accountType,
      'canAddAttendees': canAddAttendees,
      'possibleAttendeeProblems': possibleAttendeeProblems,
    };

    return data;
  }
}
