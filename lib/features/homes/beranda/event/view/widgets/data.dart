import '../../model/date.dart';
import '../../model/event_type.dart';
import '../../model/events.dart';

List<DateModel> getDates() {
  // ignore: deprecated_member_use
  List<DateModel> dates = [];
  DateModel dateModel = DateModel();

  //1
  dateModel.date = "10";
  dateModel.weekDay = "Sun";
  dates.add(dateModel);

  dateModel = DateModel();

  //1
  dateModel.date = "11";
  dateModel.weekDay = "Mon";
  dates.add(dateModel);

  dateModel = DateModel();

  //1
  dateModel.date = "12";
  dateModel.weekDay = "Tue";
  dates.add(dateModel);

  dateModel = DateModel();

  //1
  dateModel.date = "13";
  dateModel.weekDay = "Wed";
  dates.add(dateModel);

  dateModel = DateModel();

  //1
  dateModel.date = "14";
  dateModel.weekDay = "Thu";
  dates.add(dateModel);

  dateModel = DateModel();

  //1
  dateModel.date = "15";
  dateModel.weekDay = "Fri";
  dates.add(dateModel);

  dateModel = DateModel();

  //1
  dateModel.date = "16";
  dateModel.weekDay = "Sat";
  dates.add(dateModel);

  dateModel = DateModel();

  return dates;
}

List<EventTypeModel> getEventTypes() {
  List<EventTypeModel> events = [];
  EventTypeModel eventModel = EventTypeModel();

  //1
  eventModel.imgAssetPath = "assets/images/logo.png";
  eventModel.eventType = "Microfon";
  events.add(eventModel);

  eventModel = EventTypeModel();

  //1
  eventModel.imgAssetPath = "assets/images/logo.png";
  eventModel.eventType = "Sports";
  events.add(eventModel);

  eventModel = EventTypeModel();

  //1
  eventModel.imgAssetPath = "assets/images/logo.png";
  eventModel.eventType = "School";
  events.add(eventModel);

  eventModel = EventTypeModel();

  return events;
}

List<EventsModel> getEvents() {
  List<EventsModel> events = [];
  EventsModel eventsModel = EventsModel();

  //1
  eventsModel.imgeAssetPath = "assets/images/orang_shalat.png";
  eventsModel.date = "Jan 12, 2019";
  eventsModel.desc = "Sports Meet in Galaxy Field";
  eventsModel.address = "Greenfields, Sector 42, Faridabad";
  events.add(eventsModel);

  eventsModel = EventsModel();

  //2
  eventsModel.imgeAssetPath = "assets/images/orang_shalat.png";
  eventsModel.date = "Jan 12, 2019";
  eventsModel.desc = "Art & Meet in Street Plaza";
  eventsModel.address = "Galaxyfields, Sector 22, Faridabad";
  events.add(eventsModel);

  eventsModel = EventsModel();

  //3
  eventsModel.imgeAssetPath = "assets/images/orang_shalat.png";
  eventsModel.date = "Jan 12, 2019";
  eventsModel.address = "Galaxyfields, Sector 22, Faridabad";
  eventsModel.desc = "Youth Music in Gwalior";
  events.add(eventsModel);

  eventsModel = EventsModel();

  return events;
}
