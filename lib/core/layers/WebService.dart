import 'package:chopper/chopper.dart';

part 'WebService.chopper.dart';

@ChopperApi(baseUrl: "https://channab.com")
abstract class WebService extends ChopperService {
  static WebService create([ChopperClient client]) => _$WebService(client);

  //************************************************
// Login and signup
//************************************************

  @Post(path: "api/login")
  Future<Response> login(
    @Field("mobile_number") String userMobileNumber,
    @Field("password") String userPassword,
  );

//  @Post(path: "/RestUser/signUp")
//  Future<Response> googleLogin(
//      @Field("userName") String userName,
//      @Field("userEmail") String userEmail,
//      @Field("userPassword") String userPassword,
//      @Field("userDeviceToken") String userDeviceToken,
//      @Field("userDeviceType") String userDeviceType,
//      @Field("userType") int userType,
//      @Field("socialMediaID") String socialMediaID);

//  @Post(path: "/RestUser/forgetPassword")
//  Future<Response> forgetPassword(
//      @Field("userEmail") String userEmail,
//      @Field("userDeviceType") String userDeviceType,
//      @Field("userDeviceName") String userDeviceName);
//
////************************************************
//// All article related
////************************************************
//
//  @Post(path: "/RestArticle/home")
//  Future<Response> getHomeDetails(
//      @Field("userId") int userId, @Field("sessionId") String sessionId);
//
//  @Post(path: "/RestArticle/getArticles")
//  Future<Response> getArticles(
//      @Field("userId") int userId,
//      @Field("sessionId") String sessionId,
//      @Field("offset") int offset,
//      @Field("limit") int limit,
//      @Field("categoryId") String categoryId);
//
//  @Post(path: "/RestArticle/getArticleChapters")
//  Future<Response> getChaptersForArticle(
//      @Field("userId") int userId,
//      @Field("sessionId") String sessionId,
//      @Field("articleId") String articleID,
//      @Field("isArticleOfTheDay") String isArticleOfTheDay);
//
//  @Post(path: "/RestArticle/getArticleCategories")
//  Future<Response> getCategories(
//      @Field("userId") int userId,
//      @Field("sessionId") String sessionId,
//      @Field("offset") int offset,
//      @Field("limit") int limit);
//
//  @Post(path: "/RestArticle/searchAritcle")
//  Future<Response> searchArticles(
//      @Field("userId") int userId,
//      @Field("sessionId") String sessionId,
//      @Field("offset") int offset,
//      @Field("limit") int limit,
//      @Field("keys") String keys);
//
//  @Post(path: "/RestArticle/getArticleWithID")
//  Future<Response> getArticleWithID(
//      @Field("userId") int userId,
//      @Field("sessionId") String sessionId,
//      @Field("articleId") String articleID);
//
//  @Post(path: "/RestArticle/getAllCuratedList")
//  Future<Response> getCuratedList(
//      @Field("userId") int userId,
//      @Field("sessionId") String sessionId,
//      @Field("offset") int offset,
//      @Field("limit") int limit);
//
//  @Post(path: "/RestArticle/getArticleOfCuratedList")
//  Future<Response> getCuratedArticles(
//      @Field("userId") int userId,
//      @Field("sessionId") String sessionId,
//      @Field("curatedID") String curatedID);
//
//  //************************************************
//// subscription
////************************************************
//  @Post(path: "/RestUser/getPremium")
//  Future<Response> getPremiumDetails(
//      @Field("userId") int userId, @Field("sessionId") String sessionId);
//
//  @Post(path: "/RestUser/getCoupenPrice")
//  Future<Response> getCouponDetails(
//      @Field("userId") int userId,
//      @Field("sessionId") String sessionId,
//      @Field("premium_id") String premiumId,
//      @Field("coupen") String coupon);
//
//  @Post(path: "/RestUser/newCreateOrder")
//  Future<Response> createOrder(
//      @Field("userId") int userId,
//      @Field("sessionId") String sessionId,
//      @Field("premium_id") String premiumId,
//      @Field("coupen_id") String couponId);
//
//  @Post(path: "/RestUser/newCreateOrder")
//  Future<Response> createOrderWithOutCoupon(
//      @Field("userId") int userId,
//      @Field("sessionId") String sessionId,
//      @Field("premium_id") String premiumId);
//
//  @Post(path: "/RestUser/userPhone")
//  Future<Response> savePhoneNumber(@Field("userId") int userId,
//      @Field("sessionId") String sessionId, @Field("phone") String phone);
//
//  @Post(path: "/RestUser/NewSubscribeUser")
//  Future<Response> newSubscribeUser(
//      @Field("userId") int userId,
//      @Field("sessionId") String sessionId,
//      @Field("premium_id") String premiumId,
//      @Field("coupen_id") String couponID,
//      @Field("receipt") String receipt,
//      @Field("transactionMethod") String transactionMethod);
//
//  @Post(path: "/RestUser/NewSubscribeUser")
//  Future<Response> newSubscribeUserWithoutCoupon(
//      @Field("userId") int userId,
//      @Field("sessionId") String sessionId,
//      @Field("premium_id") String premiumId,
//      @Field("receipt") String receipt,
//      @Field("transactionMethod") String transactionMethod);
}
