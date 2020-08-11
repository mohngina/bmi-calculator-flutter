import 'package:service_pap/models/service_provider_model.dart';

class Service {
  final id;
  final location;
  final rating;
  final ServiceProvider provider;

  Service(this.id, this.location, this.rating, this.provider);

  static fetchAll() {
    return [];
  }
}

class ServiceCategory {
  final id;
  final name;
  final List<Service> services;

  ServiceCategory(this.id, this.name, this.services);

  static fetchAll() {
    return [
      ServiceCategory(1, 'Plumber', [
        Service(
          3,
          'Alabama',
          2.5,
          ServiceProvider(3, 'Justin', 'https://picsum.photos/202'),
        ),
        Service(
          4,
          'Brighton',
          2.0,
          ServiceProvider(4, 'Claus', 'https://picsum.photos/203'),
        ),
      ]),
      ServiceCategory(1, 'Electrician', [
        Service(
          1,
          'West Side',
          3.7,
          ServiceProvider(1, 'Super Brendah', 'https://picsum.photos/200'),
        ),
      ]),
      ServiceCategory(1, 'Cleaner', [
        Service(
          2,
          'East Coast',
          2.1,
          ServiceProvider(2, 'Mia', 'https://picsum.photos/201'),
        ),
        Service(
          5,
          'Greenland',
          4.5,
          ServiceProvider(5, 'Mega Wash', 'https://picsum.photos/204'),
        ),
        Service(
          6,
          'Finland',
          4.5,
          ServiceProvider(
              5, 'This is a long name', 'https://picsum.photos/205'),
        ),
      ]),
    ];
  }
}
