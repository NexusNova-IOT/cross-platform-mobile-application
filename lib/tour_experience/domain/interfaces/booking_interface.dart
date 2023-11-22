import '../entities/booking.dart';

abstract class BookingRepository {
  Future<List<Booking>> getBookingsByTouristId(String id);
  Future<List<Booking>> getBookingsByAgencyId(String id);
}