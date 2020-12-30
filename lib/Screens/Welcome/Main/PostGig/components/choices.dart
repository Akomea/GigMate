import 'package:smart_select/smart_select.dart' show S2Choice;

List<S2Choice<String>> eventType = [
  S2Choice<String>(value: 'bp', title: 'Birthday Party'),
  S2Choice<String>(value: 'fre', title: 'Festive Religious Event'),
  S2Choice<String>(value: 'cp', title: 'Children\'s Party'),
  S2Choice<String>(value: 'cb', title: 'Christening - Baptism'),
  S2Choice<String>(value: 'csp', title: 'Christmas Party'),
  S2Choice<String>(value: 'con', title: 'Concert'),
  S2Choice<String>(value: 'fes', title: 'Festival'),
  S2Choice<String>(value: 'fnw', title: 'Funeral - Wake'),
  S2Choice<String>(value: 'fnc', title: 'Funeral - Ceremony'),
  S2Choice<String>(value: 'gdp', title: 'Graduation Party'),
  S2Choice<String>(value: 'gro', title: 'Grand Opening'),
  S2Choice<String>(value: 'hal', title: 'Halloween'),
  S2Choice<String>(value: 'muv', title: 'Music Venue'),
  S2Choice<String>(value: 'nye', title: 'New Year\s Eve'),
  S2Choice<String>(value: 'nic', title: 'Night Club'),
  S2Choice<String>(value: 'pic', title: 'Picnic'),
  S2Choice<String>(value: 'pri', title: 'Private Event'),
  S2Choice<String>(value: 'ovc', title: 'Online Virtual Concert'),
  S2Choice<String>(value: 'bap', title: 'Bar Pub'),
  S2Choice<String>(value: 'rsr', title: 'Recording Session - Remote'),
  S2Choice<String>(value: 'rso', title: 'Recording Session - On Site'),
  S2Choice<String>(value: 'val', title: 'Valentine\'s Day'),
  S2Choice<String>(value: 'wed', title: 'Wedding'),
  S2Choice<String>(value: 'map', title: 'Marriage Proposal'),
  S2Choice<String>(value: 'ann', title: 'Anniversary'),
  S2Choice<String>(value: 'sho', title: 'Shower'),
  S2Choice<String>(value: 'rct', title: 'Reception'),
  S2Choice<String>(value: 'eng', title: 'Engagement'),
];

List<S2Choice<String>> location = [
  S2Choice<String>(value: 'loc1', title: 'Accra'),
];

List<Map<String, dynamic>> provision = [
  {'value': 'p1', 'title': 'Food & Drinks'},
  {'value': 'p2', 'title': 'Parking Space'},
  {'value': 'p3', 'title': 'Accommodation'},
  {'value': 'p4', 'title': 'Lighting'},
  {'value': 'p5', 'title': 'PA Sound System'},
  {'value': 'p6', 'title': 'Drum Kit'},
  {'value': 'p7', 'title': 'Instruments'},
  {'value': 'p8', 'title': 'Microphones'},
  {'value': 'p9', 'title': 'Amplifier'},
];

List<Map<String, dynamic>> audienceSize = [
  {'id': 'a1', 'name': 'Less than 50'},
  {'id': 'a2', 'name': 'More than 100'},
  {'id': 'a3', 'name': 'Less than 500'},
  {'id': 'a3', 'name': 'More than 1000'},
];

List<Map<String, dynamic>> areaType = [
  {'id': 'in', 'name': 'Indoor'},
  {'id': 'outc', 'name': 'Outdoor (Covered)'},
  {'id': 'outu', 'name': 'Outdoor (Uncovered)'},
];
List<S2Choice<String>> contactMode = [
  S2Choice<String>(value: 'pho', title: 'Phone/WhatsApp'),
  S2Choice<String>(value: 'iam', title: 'In-App Messaging'),
  S2Choice<String>(value: 'em', title: 'E-mail'),
];

List<Map<String, dynamic>> musicStyle = [
  {'value': 'm1', 'title': 'Upbeat'},
  {'value': 'm2', 'title': 'Gospel'},
  {'value': 'm3', 'title': 'Highlife'},
  {'value': 'm4', 'title': 'Palmwine'},
  {'value': 'm5', 'title': '80\'s Old Skool'},
  {'value': 'm6', 'title': 'Instrumental'},
  {'value': 'm7', 'title': 'Covers of well known songs'},
  {'value': 'm8', 'title': 'Jazz'},
];
