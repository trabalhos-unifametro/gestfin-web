import 'package:flutter/foundation.dart';
import 'dart:js' as js;

bool isProduction = kReleaseMode;
var hostname = js.context['location']['hostname'];

var baseAPIs = hostname.toString();
final urlAPIs = 'http://$baseAPIs:5005/api/v1';

// AUTHENTICATION ROUTES
const routeLogin = '/auth/signin';

// USER ROUTES
const routeUserMyData = '/user/my_data';