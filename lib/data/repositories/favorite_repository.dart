import '../../models/favorite.dart';
import '../dao/favorite_dao.dart';

class FavoriteRepository {
  final FavoriteDao _dao = FavoriteDao();

  Future<List<Favorite>> getFavorites(String email) {
    return _dao.getFavorites(email);
  }

  Future<bool> toggleFavorite(Favorite favorite) {
    return _dao.toggleFavorite(favorite);
  }
}