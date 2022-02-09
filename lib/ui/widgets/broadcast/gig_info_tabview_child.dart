import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:smart_select/smart_select.dart';

import 'event_choices.dart' as choices;

class GigInfoTBChild extends StatefulWidget {
  @override
  _GigInfoTBChildState createState() => _GigInfoTBChildState();
}

class _GigInfoTBChildState extends State<GigInfoTBChild> {
  String _category = '';
  String _areaType = '';
  String _audienceSize = '';
  bool _gospelSwitch = false;
  List<String> _provision = [];
  List<String> _musicStyle = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 2),
            color: Colors.white,
            child: SmartSelect<String>.single(
              title: 'Location',
              placeholder: 'Tema',
              value: _category,
              choiceItems: choices.eventType,
              modalType: S2ModalType.bottomSheet,
              choiceType: S2ChoiceType.chips,
              choiceStyle: S2ChoiceStyle(
                showCheckmark: true,
              ),
              tileBuilder: (context, state) => S2Tile.fromState(
                state,
                isTwoLine: true,
                leading: Icon(Icons.location_pin),
              ),
              onChange: (state) => setState(() => _category = state.value),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 2),
            color: Colors.white,
            child: SmartSelect<String>.multiple(
              title: 'Provision',
              placeholder: 'What will be available?',
              value: _provision,
              onChange: (state) => setState(() => _provision = state.value),
              choiceItems: S2Choice.listFrom<String, Map>(
                source: choices.provision,
                value: (index, item) => item['value'],
                title: (index, item) => item['title'],
              ),
              modalType: S2ModalType.bottomSheet,
              choiceType: S2ChoiceType.chips,
              choiceStyle: S2ChoiceStyle(
                showCheckmark: true,
              ),
              tileBuilder: (context, state) => S2Tile.fromState(
                state,
                isTwoLine: true,
                leading: Icon(Icons.wine_bar),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 2),
            color: Colors.white,
            child: SmartSelect<String>.single(
              title: 'Type of Area',
              placeholder: 'Outdoor (Covered)',
              value: _areaType,
              onChange: (state) => setState(() => _category = state.value),
              choiceItems: S2Choice.listFrom<String, Map>(
                source: choices.areaType,
                value: (index, item) => item['id'],
                title: (index, item) => item['name'],
              ),
              modalType: S2ModalType.bottomSheet,
              choiceType: S2ChoiceType.radios,
              choiceStyle: S2ChoiceStyle(
                showCheckmark: true,
              ),
              tileBuilder: (context, state) => S2Tile.fromState(
                state,
                isTwoLine: true,
                leading: Icon(Icons.add_business),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 2),
            color: Colors.white,
            child: SmartSelect<String>.single(
              title: 'Audience Size',
              placeholder: 'Less than 50',
              value: _audienceSize,
              choiceItems: S2Choice.listFrom<String, Map>(
                source: choices.audienceSize,
                value: (index, item) => item['id'],
                title: (index, item) => item['name'],
              ),
              modalType: S2ModalType.bottomSheet,
              choiceType: S2ChoiceType.radios,
              choiceStyle: S2ChoiceStyle(
                showCheckmark: true,
              ),
              tileBuilder: (context, state) => S2Tile.fromState(
                state,
                isTwoLine: true,
                leading: Icon(Icons.emoji_people_rounded),
              ),
              onChange: (state) => setState(() => _category = state.value),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 2),
            color: Colors.white,
            child: SmartSelect<String>.multiple(
              title: 'Style Of Music',
              placeholder: 'Upbeat, gospel, highlife',
              value: _musicStyle,
              onChange: (state) => setState(() => _musicStyle = state.value),
              choiceItems: S2Choice.listFrom<String, Map>(
                source: choices.musicStyle,
                value: (index, item) => item['value'],
                title: (index, item) => item['title'],
              ),
              modalType: S2ModalType.bottomSheet,
              choiceType: S2ChoiceType.chips,
              choiceStyle: S2ChoiceStyle(
                showCheckmark: true,
              ),
              tileBuilder: (context, state) => S2Tile.fromState(
                state,
                isTwoLine: true,
                leading: Icon(Icons.library_music),
              ),
            ),
          ),
          SettingsList(
            backgroundColor: Colors.white,
            shrinkWrap: true,
            sections: [
              SettingsSection(
                tiles: [
                  SettingsTile.switchTile(
                    title: 'Gospel Musicians Only',
                    leading: Icon(Icons.person_search),
                    switchValue: _gospelSwitch,
                    onToggle: (bool value) {
                      setState(() {
                        _gospelSwitch = !_gospelSwitch;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
