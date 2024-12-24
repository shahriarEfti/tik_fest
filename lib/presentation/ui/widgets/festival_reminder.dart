import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class FestivalReminder extends StatelessWidget {
  const FestivalReminder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.black54,
      ),
      height: 120,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Classical Music Festival 2024",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                "View all",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TimerBox(),
            ],
          )
        ],
      ),
    );
  }
}

class TimerBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TimerCountdown(
      format: CountDownTimerFormat.daysHoursMinutesSeconds,
      endTime: DateTime.now().add(
        const Duration(
          days: 5,
          hours: 14,
          minutes: 27,
          seconds: 34,
        ),
      ),
      onEnd: () {
        print("Timer finished");
      },
      timeTextStyle: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      spacerWidth: 10,
      colonsTextStyle: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.redAccent,
      ),
    );
  }
}
