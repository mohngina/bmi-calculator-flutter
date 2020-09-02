import 'package:service_pap/services/api.dart' as api;

Future getAll() => api.get('/services/');
Future getByCategory(category) => api.get('/services/?category=$category');
