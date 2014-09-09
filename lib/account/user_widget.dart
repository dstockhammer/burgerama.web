part of burgerama;

@Component(
    selector: 'user-widget',
    publishAs: 'ctrl',
    templateUrl: 'lib/account/widget.html',
    useShadowDom: false
)
class UserWidgetComponent {
  bool isSignedIn = false;
  User user;

  void SignInModal() {

  }

  void SignOut() {

  }
}