import 'package:finance_app/data/1.dart';

List<Money> geter() {
  Money upwork = Money();
  upwork.name = 'upwork';
  upwork.fee = '650';
  upwork.time = 'today';
  upwork.image = 'assets/images/upp.png';
  upwork.buy = false;
  Money starbucks = Money();
  starbucks.buy = true;
  starbucks.fee = '15';
  starbucks.image = 'assets/images/Transfer.png';
  starbucks.name = 'starbucks';
  starbucks.time = 'today';
  Money trasfer = Money();
  trasfer.buy = true;
  trasfer.fee = '100';
  trasfer.image = 'assets/images/str.jpg';
  trasfer.name = 'trasfer for sam';
  trasfer.time = 'jan 30,2022';
  return [upwork, starbucks, trasfer, upwork, starbucks, trasfer];
}
