import 'package:venue_api_dart/api.dart';

VenueAPI venueAPI;
const API_SERVER = "http://104.131.185.159:9000/";

void connectAPI(){
  venueAPI = new VenueAPI(API_SERVER);
}
