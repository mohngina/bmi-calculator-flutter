import 'dart:convert';

import 'package:service_pap/models/user_model.dart';
import 'package:service_pap/services/services.dart' as services;

class TestServiceProvider {
  final id;
  final TestUser user;

  TestServiceProvider({this.id, this.user});

  factory TestServiceProvider.fromJson(Map<String, dynamic> json) {
    print(json);

    return TestServiceProvider(
      id: json['id'],
      user: TestUser.fromJson(json['user']),
    );
  }
}

class TestService {
  final id;
  final name;
  final price;
  final TestServiceProvider provider;

  TestService({this.id, this.name, this.price, this.provider});

  factory TestService.fromJson(Map<String, dynamic> json) {
    return TestService(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      provider: TestServiceProvider.fromJson(json['provider']),
    );
  }

  static fetchAll() async {
    var response = await services.getAll();
    List<TestService> pulledServices = [];
    List<dynamic> data = json.decode(response.body)['data'];

    for (var service in data) {
      pulledServices.add(TestService.fromJson(service));
    }

    print('Pulled Services: $data');
    return pulledServices;
  }
}

class ServiceProvider {
  final id;
  final name;
  final profileImage;

  ServiceProvider(this.id, this.name, this.profileImage);
}

class Service {
  final id;
  final location;
  final rating;
  final ServiceProvider provider;

  Service(this.id, this.location, this.rating, this.provider);

  static fetchAll() async {
    var response = await services.getAll();
    print(response);
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
          1.5,
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
      ServiceCategory(1, 'Cook', [
        Service(
          20,
          'East Coast',
          3.1,
          ServiceProvider(1, 'Sweet Mary', 'https://picsum.photos/220'),
        ),
      ]),
    ];
  }
}
