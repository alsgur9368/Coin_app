import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:ui';
import 'package:coin_main/Main/main.dart';

// Example holidays
final Map<DateTime, List> _holidays = {
  DateTime(2020, 1, 1): ['New Year\'s Day'],
  DateTime(2020, 1, 6): ['Epiphany'],
  DateTime(2020, 2, 14): ['Valentine\'s Day'],
  DateTime(2020, 4, 21): ['Easter Sunday'],
  DateTime(2020, 4, 22): ['Easter Monday'],
};
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  MainPage mainPage;
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  double height(double value) {
    return MediaQuery.of(context).size.height * (value / 812);
  }

  double width(double value) {
    return MediaQuery.of(context).size.width * (value / 375);
  }

  Map<DateTime, List> _events;
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();
    _events = {
      _selectedDay.subtract(Duration(days: 30)): [
        'Event A0',
        'Event B0',
        'Event C0',
      ],
      _selectedDay.subtract(Duration(days: 27)): [
        'Event A1',
      ],
      _selectedDay.subtract(Duration(days: 20)): [
        'Event A2',
        'Event B2',
        'Event C2',
        'Event D2',
      ],
      _selectedDay.subtract(Duration(days: 16)): [
        'Event A3',
        'Event B3',
      ],
      _selectedDay.subtract(Duration(days: 10)): [
        'Event A4',
        'Event B4',
        'Event C4',
      ],
      _selectedDay.subtract(Duration(days: 4)): [
        '동계 동아리활동 13:00',
        'C 교육',
        '동아리 규칙 설명',
      ],
      _selectedDay.subtract(Duration(days: 2)): [
        '동계 동아리활동 13:00',
        'Coin k-헤커톤 회의',
      ],
      _selectedDay: [
        '동계 동아리활동 13:00',
        'k-헤커톤 일정 정리',
        'Coin 동아리앱 계획',
        '출결 체크',
      ],
      _selectedDay.add(Duration(days: 1)): [
        '동계 동아리활동 13:00',
        '창업리그 구체화',
        '헤커톤 구체화',
        '동아리 내부회의',
      ],
      _selectedDay.add(Duration(days: 3)): Set.from([
        '동계 동아리활동 13:00',
        '어쩌구 회의',
        '아무튼 개발',
      ]).toList(),
      _selectedDay.add(Duration(days: 7)): [
        '동계 동아리활동 13:00',
        'Coin 동아리 어플 개발회의 13:00',
        '동아리방 대청소 16:00',
      ],
      _selectedDay.add(Duration(days: 11)): [
        '일정 1',
        '일정 2',
      ],
      _selectedDay.add(Duration(days: 17)): [
        '동계 동아리활동 13:00',
        '동계 동아리활동 13:00',
        '동계 동아리활동 13:00',
        '동계 동아리활동 13:00',
      ],
      _selectedDay.add(Duration(days: 22)): ['Event A13', 'Event B13'],
      _selectedDay.add(Duration(days: 26)): [
        'Event A14',
        'Event B14',
        'Event C14',
      ],
    };

    _selectedEvents = _events[_selectedDay] ?? [];
    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events, List holidays) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height(70),
        elevation: 0,
        backgroundColor: Color(0xfffcfcfc),
        leading: IconButton(
            icon: Icon(Icons.chevron_left, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        title: Text('캘린더', textAlign: TextAlign.center, style: TextStyle(color: Colors.black)),
        bottom: PreferredSize(
          child: Container(
            color: Colors.grey[300],
            height: height(2),
          ),
          preferredSize: Size.fromHeight(2),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(width(20), height(30), width(20), height(20)),
              width:double.infinity,
              height: queryData.size.height * 350/queryData.size.height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10), //border corner radius
                boxShadow:[
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), //color of shadow
                    spreadRadius: 5, //spread radius
                    blurRadius: 7, // blur radius
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                _buildTableCalendar(),
                  ]
                ),
            ),
            //-----------------------
            // _buildTableCalendarWithBuilders(),
            SizedBox(height: height(8)),
            SizedBox(height: height(8)),
            Expanded(child: _buildEventList()),
          ],
        ),
      ),
    );
  }

  // Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalendar() {
    return TableCalendar(
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      calendarStyle: CalendarStyle(
        selectedColor: Colors.orangeAccent[200],
        todayColor: Colors.orangeAccent[200],
        markersColor: Colors.lightBlue[300],
        outsideDaysVisible: false,
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle:
            TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.deepOrange[400],
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }

  // More advanced TableCalendar configuration (using Builders & Styles)
  Widget _buildTableCalendarWithBuilders() {
    return TableCalendar(
      locale: 'ko-KR',
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      availableGestures: AvailableGestures.all,
      availableCalendarFormats: const {
        CalendarFormat.month: '',
        CalendarFormat.week: '',
      },
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        weekendStyle: TextStyle().copyWith(color: Colors.blue[800]),
        holidayStyle: TextStyle().copyWith(color: Colors.blue[800]),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle().copyWith(color: Colors.blue[600]),
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonVisible: false,
      ),
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
            child: Container(
              margin: EdgeInsets.fromLTRB(width(4),height(4),width(4),height(4)),
              padding: EdgeInsets.fromLTRB(width(6),height(5),0,0),
              color: Colors.deepOrange[300],
              width: width(100),
              height: height(100),
              child: Text(
                '${date.day}',
                style: TextStyle().copyWith(fontSize: 16.0),
              ),
            ),
          );
        },
        todayDayBuilder: (context, date, _) {
          return Container(
            margin: EdgeInsets.fromLTRB(width(4),height(4),width(4),height(4)),
            padding: EdgeInsets.fromLTRB(width(6),height(5),0,0),
            color: Colors.amber[400],
            width: width(100),
            height: height(100),
            child: Text(
              '${date.day}',
              style: TextStyle().copyWith(fontSize: 16.0),
            ),
          );
        },
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];

          if (events.isNotEmpty) {
            children.add(
              Positioned(
                right: 1,
                bottom: 1,
                child: _buildEventsMarker(date, events),
              ),
            );
          }

          if (holidays.isNotEmpty) {
            children.add(
              Positioned(
                right: -2,
                top: -2,
                child: _buildHolidaysMarker(),
              ),
            );
          }

          return children;
        },
      ),
      onDaySelected: (date, events, holidays) {
        _onDaySelected(date, events, holidays);
        _animationController.forward(from: 0.0);
      },
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: _calendarController.isSelected(date)
            ? Colors.brown[500]
            : _calendarController.isToday(date)
                ? Colors.brown[300]
                : Colors.blue[400],
      ),
      width: width(16),
      height: height(16),
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }
  Widget _buildHolidaysMarker() {
    return Icon(
      Icons.add_box,
      size: width(20),
      color: Colors.blueGrey[800],
    );
  }

  Widget _buildEventList() {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(width(20),0,width(20),0),
            width:double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10), //bo``rder corner radius
                    boxShadow:[
                        BoxShadow(
                        color: Colors.grey.withOpacity(0.5), //color of shadow
                        spreadRadius: 5, //spread radius
                        blurRadius: 7, // blur radius
                        offset: Offset(0, 2), // changes position of shadow
                        ),
                    ],
                ),
            child: Container(
              child: Column(
                children: _selectedEvents
                    .map((event) => Container(
                          margin: EdgeInsets.zero,
                          child: ListTile(
                            title: Text(event.toString()),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
      ],
    );
  }
}
