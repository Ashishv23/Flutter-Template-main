import 'package:flutter/material.dart';
import 'package:flutter_template/src/index.dart';

String localizedText(String key, BuildContext context) {
  switch (key) {
    case 'COMMON_LIST_ALL_ITEMS':
      return AppLocalizations.of(context)?.commonListAllItems ?? '';
    case 'COMMON_LIST_FILTER_ITEMS':
      return AppLocalizations.of(context)?.commonListFilterItems ?? '';
    case 'COMMON_GET_ITEM':
      return AppLocalizations.of(context)?.commonGetItem ?? '';
    case 'COMMON_CREATE_ITEM':
      return AppLocalizations.of(context)?.commonCreateItem ?? '';
    case 'COMMON_UPDATE_ITEM':
      return AppLocalizations.of(context)?.commonUpdateItem ?? '';
    case 'COMMON_DELETE_ITEM':
      return AppLocalizations.of(context)?.commonDeleteItem ?? '';
    case 'COMMON_GET_ITEM_NOTFOUND':
      return AppLocalizations.of(context)?.commonGetItemNotfound ?? '';
    case 'COMMON_UPDATE_ITEM_NOTFOUND':
      return AppLocalizations.of(context)?.commonUpdateItemNotfound ?? '';
    case 'COMMON_DELETE_ITEM_NOTFOUND':
      return AppLocalizations.of(context)?.commonDeleteItemNotfound ?? '';
    case 'COMMON_LIST_EXCEPTION':
      return AppLocalizations.of(context)?.commonListException ?? '';
    case 'COMMON_GET_EXCEPTION':
      return AppLocalizations.of(context)?.commonGetException ?? '';
    case 'COMMON_CREATE_EXCEPTION':
      return AppLocalizations.of(context)?.commonCreateException ?? '';
    case 'COMMON_PUT_EXCEPTION':
      return AppLocalizations.of(context)?.commonPutException ?? '';
    case 'COMMON_DELETE_EXCEPTION':
      return AppLocalizations.of(context)?.commonDeleteException ?? '';
    case 'COMMON_POST_EXCEPTION':
      return AppLocalizations.of(context)?.commonPostException ?? '';
    case 'USER_LOGIN':
      return AppLocalizations.of(context)?.userLogin ?? '';
    case 'USER_REGISTER':
      return AppLocalizations.of(context)?.userRegister ?? '';
    case 'USER_RENEW_TOKEN':
      return AppLocalizations.of(context)?.userRenewToken ?? '';
    case 'USER_FORGOT_PASSWORD':
      return AppLocalizations.of(context)?.userForgotPassword ?? '';
    case 'USER_RESET_PASSWORD':
      return AppLocalizations.of(context)?.userResetPassword ?? '';
    case 'USER_INVITE_USER':
      return AppLocalizations.of(context)?.userInviteUser ?? '';
    case 'USER_EMAIL_VERIFICATION_SENT':
      return AppLocalizations.of(context)?.userEmailVerificationSent ?? '';
    case 'USER_EMAIL_VERIFICATION_SUCCESS':
      return AppLocalizations.of(context)?.userEmailVerificationSuccess ?? '';
    case 'USER_ACCESSREQUEST_SUCCESS':
      return AppLocalizations.of(context)?.userAccessrequestSuccess ?? '';
    case 'USER_LOGOUT_SUCCESS':
      return AppLocalizations.of(context)?.userLogoutSuccess ?? '';
    case 'USER_LOGIN_FAILED':
      return AppLocalizations.of(context)?.userLoginFailed ?? '';
    case 'USER_RENEW_TOKEN_FAILED':
      return AppLocalizations.of(context)?.userRenewTokenFailed ?? '';
    case 'USER_REGISTER_FAILED':
      return AppLocalizations.of(context)?.userRegisterFailed ?? '';
    case 'USER_FORGOT_PASSWORD_FAILED':
      return AppLocalizations.of(context)?.userForgotPasswordFailed ?? '';
    case 'USER_CHANGE_PASSWORD_FAILED':
      return AppLocalizations.of(context)?.userChangePasswordFailed ?? '';
    case 'USER_LAST4_PASSWORD_FAILED':
      return AppLocalizations.of(context)?.userLast4PasswordFailed ?? '';
    case 'USER_INVALID_PASSWORD':
      return AppLocalizations.of(context)?.userInvalidPassword ?? '';
    case 'USER_INVITE_USER_FAILED':
      return AppLocalizations.of(context)?.userInviteUserFailed ?? '';
    case 'USER_EMAIL_VERIFICATION_FAILED':
      return AppLocalizations.of(context)?.userEmailVerificationFailed ?? '';
    case 'USER_ACCESSREQUEST_FAILED':
      return AppLocalizations.of(context)?.userAccessrequestFailed ?? '';
    case 'USER_LOGIN_FAILED_INVITATION':
      return AppLocalizations.of(context)?.userLoginFailedInvitation ?? '';
    case 'USER_LOGIN_FAILED_RESET':
      return AppLocalizations.of(context)?.userLoginFailedReset ?? '';
    case 'USER_LOGOUT_FAILED':
      return AppLocalizations.of(context)?.userLogoutFailed ?? '';
    case 'USER_EMAIL_DUPLICATE':
      return AppLocalizations.of(context)?.userEmailDuplicate ?? '';
    case 'USER_ALREADY_LOGIN_DEVICE':
      return AppLocalizations.of(context)?.userAlreadyLoginDevice ?? '';
    case 'SETTING_NOSMTP_SETTING':
      return AppLocalizations.of(context)?.settingNosmtpSetting ?? '';
    case 'SETTING_SENDEMAIL_FAILD':
      return AppLocalizations.of(context)?.settingSendemailFaild ?? '';
    case 'SEND_VERIFICATION_CODE_FAILED':
      return AppLocalizations.of(context)?.sendVerificationCodeFailed ?? '';
    case 'SEND_VERIFICATION_CODE':
      return AppLocalizations.of(context)?.sendVerificationCode ?? '';
    case 'CF_ALREADY_REGISTER':
      return AppLocalizations.of(context)?.cfAlreadyRegister ?? '';
    default:
      return key;
  }
}
