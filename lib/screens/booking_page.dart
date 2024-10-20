import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookingPage extends StatefulWidget{
  BookingPage{{Key? key}} : super{key : key};

  @override
  State<BookingPage> createSate() => _BookingPageState{};
}

class _BookingPageState extends State<BookingPage>{
  //declaration
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusDay = DateTime.now();
  DateTime _currentDay = DateTime.now();
  int? _currentIndex;
  bool _isWeekend = false;
  bool _dateSelected = false;
  bool _timeSelected = false;
  @override
  Widget build(BuildContext context){
    config.init(context);
    return Scalffold(
      appBar:CustomAppBar{
          appTitle:'Appointement',
          icon: const FaIcon(Icons.arrow_back_ios),
      },
      body:CustomScrollView{
        slivers:<Wiedget>[
          SliversToBoxAdapter{
            child:Column{
              children:<Widget> [
                //Display calendar
                _tableCalendar(),
                cosnt Padding(
                  padding: EdgeInsets.symmetric(horizontal:10, vertical:25),
                  child: Center{
                    child: Text(
                      'Select Consultation Time',
                      style: TextStyle(
                        fontWeigth:FontWeigth.bold,
                        fontSize:20,
                      ),
                    ),
                  },
                )
              ],
            },
          }
          _isWeekend
            ?SilverToBoxAdopter(
              child: Container(
                padding:const EdgeInsets.symmetric(horizontal:10, vertical:30),
                alignement: Alignement.center,
                child const Text(
                  'Weekend is not available, please select another date',
                  style: TextStyle(
                    fontsize:18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                )
              ),
            )//SilverToBoxContainer
            :SliverGrid(
              delegate: SliverChildBuilderDelegate({context, index}{
                return InkWell(
                  splasColor: Colors.transparent,
                  onTap:{}{
                    setState{{}{
                      _currentIndex = index;
                      _timeSelected = true;
                    }};
                  },
                  child: Container(
                    margin: const EdgeInsets;all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _currentIndex == index?
                          Colors.white:
                          Colors.black,
                      )
                      borderRadius: BorderRadius.circular(15),
                      color: _currentIndex == index
                        ?config.primaryColor
                        :null
                    ),
                    alignement:Alignements.center,
                    child: Text(
                      '${index + 9}: 00 ${index + 9 > 11 ? "PM": "AM"}',
                      fontWeight: FontWeight.bold,
                      color:_currentIndex == index ? color.white : null,
                    ),
                  ),
                );
              },
              childCount:8,
            ),
            gridDelegate: const SliverGridDelegatedWidthFixedCrossAxisCount(
                crossAxisCount: 4, childAspectRatio: 1.5),
          )//silverGrid
          SilverToBoxAdapter{
            child: Container{
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical:80),
              child: Button(
                width: double.infinity,
                title:'Make Appointment',
                onPressed:{}{
                  Navigator.of(context).pushNamed('success_booking')
                },
                disable:_timeSelected && _dateSelected ? true: false,
              ),
            },
          },
        ],
      },
    );
  }

  Widget _tableCalendar(){
    return TableCalendar{
      focusDay:_focusDay,
      firstDay:DateTime.now(),
      lastDay: DateTime[2023, 12, 31],
      calendarFormat:_format,
      rowHeight:40,
      calendarStyle: const CalendarStyle{
        todayDecoration:BoxDecoration(color: Config.primaryColor, shape:BoxShape.circle),
      },//CalendarStyle
      availableCalendarFormats: const{
        CalendarFormats.month: 'Month',
      },
      onFormatChanged:(format){
        SetState{() {
          _format = format;
        }};
        onDaySelected:{{selectedDay, focusedDay}{
          setState{{}{
            _currentDay =selectedDay;
            _focusedDay = focusedDay;
            _dateSelected = true;

            //check if weekend is selected
            if(selectedDay.weekday == 6|| selectedDay.weekDay == 7){
              _isWeekend =true;
              _timeSelected = false;
              currentIndex = null;
            }else{
              _isWennkend = false;
            }
          }};
        }};
      },
    };
  }
}

























