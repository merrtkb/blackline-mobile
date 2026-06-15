import '../data/repositories/favorite_repository.dart';
import '../models/favorite.dart';

class FavoriteService {
  final FavoriteRepository _repository = FavoriteRepository();

  Future<List<Favorite>> getFavorites(String email) {
    return _repository.getFavorites(email);
  }

  Future<bool> toggleFavorite(Favorite favorite) {
    return _repository.toggleFavorite(favorite);
  }
}