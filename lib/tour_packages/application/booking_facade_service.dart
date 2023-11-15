import '../domain/entities/booking.dart';
import '../domain/interfaces/booking_interface.dart';

class BookingFacadeService {
  final BookingRepository bookingRepository;

  BookingFacadeService({required this.bookingRepository});

  Future<List<Booking>> getBookingByTouristId(String id) {
    return bookingRepository.getBookingsByTouristId(id);
  }
}