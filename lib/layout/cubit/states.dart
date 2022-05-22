abstract class ShopAppStates{}
class InitialShopAppState extends ShopAppStates{}
class ChangeBottomCurrent extends ShopAppStates{}
class GetHomeDataSuccessState extends ShopAppStates{}
class GetHomeDataErrorState extends ShopAppStates{}
class GetCategoriesSuccessState extends ShopAppStates{}
class GetProductSuccessState extends ShopAppStates{}
class GetDevicesSuccessState extends ShopAppStates{}
class GetMenSuccessState extends ShopAppStates{}
class GetUsersSuccessState extends ShopAppStates{}
class GetUsersErrorState extends ShopAppStates
{
  final String error;

  GetUsersErrorState(this.error);
}
class GetMenLoadingState extends ShopAppStates{}
class BackToHomeScreenState extends ShopAppStates{}
class GetImageSuccessState extends ShopAppStates{}
class PutImageSuccessState extends ShopAppStates{}
class ShowButtonSheetState extends ShopAppStates{}
class PutImageErrorState extends ShopAppStates
{
  final String error;

  PutImageErrorState(this.error);
}
class ChangeCheckState extends ShopAppStates{}
class ChangeTimeState extends ShopAppStates{}
class GetBestSuccessState extends ShopAppStates{}
class GetBestLoadingState extends ShopAppStates{}
class GetBestErrorState extends ShopAppStates {
  final String error;

  GetBestErrorState(this.error);
}
class GetMoreSuccessState extends ShopAppStates{}
class GetMoreLoadingState extends ShopAppStates{}
class GetMoreErrorState extends ShopAppStates
  {
  final String error;

  GetMoreErrorState(this.error);
  }
class AddIndexSuccessState extends ShopAppStates{}
class MinIndexSuccessState extends ShopAppStates{}
class CreateTableSuccessState extends ShopAppStates{}
class GetTableSuccessState extends ShopAppStates{}
class DeleteTableSuccessState extends ShopAppStates{}
class InsertTableSuccessState extends ShopAppStates{}
class LogOutState extends ShopAppStates{}



