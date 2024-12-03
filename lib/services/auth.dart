import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  String? verificationId;

  Future<void> signInWithEmailAndPassword({required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> createUserWithEmailAndPassword({required String email, required String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    _firebaseAuth.signOut();
  }

  Future<void> signInWithCredential(PhoneAuthCredential credential) async {
    await _firebaseAuth.signInWithCredential(credential);
  }

  Future<void> phoneAuthentication({
    required String phoneNumber,
    required void Function(PhoneAuthCredential) verificationCompleted,
    required void Function(FirebaseAuthException) verificationFailed,
    required void Function(String, int?) codeSent,
    required void Function(String) codeAutoRetrievalTimeout,
  }) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId = verificationId;  
        codeSent(verificationId, resendToken);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId = verificationId;  
        codeAutoRetrievalTimeout(verificationId);
      },
    );
  }

  Future<void> verifyOtp(String otp) async {
    final PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId!,
      smsCode: otp,
    );
    await _firebaseAuth.signInWithCredential(credential);
  }
}
/*Future<void> phoneAuthentication(String phoneNumber) async{
await _firebaseAuth.verifyPhoneNumber(
phoneNumber:phoneNumber,
verificationCompleted: (credential) async{
await _firebaseAuth.signInWithCredential(credential);
},
codeSent:(verificationId, resendToken){
this.verificationId.value = verificationId;},
codeAutoRetrievalTimeout:(verificationId){
this.verificationId.value = verificationId};
verificationFailed: (e){
if (e.code == 'Invalid-phone-number'){
  Get.snackbar('Error', 'The provided phone number is not valid.');}
  else{
  Get.snackbar('Error', 'Something went wrong. Try again.');}};
)}
*/