import '../../domain/entities/booking.dart';
import '../../domain/interfaces/booking_interface.dart';
import '../data_sources/booking_data_provider.dart';

class BookingRepositoryImpl implements BookingRepository {
  final BookingDataProvider dataProvider;

  BookingRepositoryImpl({required this.dataProvider});

  @override
  Future<List<Booking>> getBookingsByTouristId(String id) async {
    try {
      final List<Booking> bookings = await dataProvider.getBookingsByTouritstId(id);
      return bookings;
    } catch (e) {
      throw Exception('Failed to get the bookings with tourist ID $id: $e');
    }
  }

}