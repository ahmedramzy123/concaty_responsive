abstract class ShopLoginStates{}
class ShopLoginInitial extends ShopLoginStates{}
class GetDataShopLoginLoading extends ShopLoginStates{}
class SuccessLoginUser extends ShopLoginStates
{
  final String uid;

  SuccessLoginUser(this.uid);
}
class SuccessSignupGoogle extends ShopLoginStates{}
class GetDataShopLoginSuccess extends ShopLoginStates {}
class ChangeIconState extends ShopLoginStates{}