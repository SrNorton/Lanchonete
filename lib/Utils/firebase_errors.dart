import 'package:firebase_auth/firebase_auth.dart';

String getErrorString(FirebaseAuthException error) {
  switch (error.code) {
   
    case 'invalid-credential':
      return 'Senha ou Email incorretos.';
    case 'email-already-in-use':
      return 'Este e-mail já está em uso por outra conta.';
    case 'account-exists-with-different-credential':
      return 'Já existe uma conta com este e-mail, mas usando um método de login diferente.';
    case 'requires-recent-login':
      return 'É necessário fazer login novamente.';
    case 'credential-already-in-use':
      return 'Esta credencial já está em uso por outra conta.';
    case 'invalid-verification-code':
      return 'O código de verificação é inválido ou expirou.';
    case 'missing-phone-number':
      return 'É necessário um número de telefone para esta operação.';
    case 'captcha-check-failed':
      return 'O desafio reCAPTCHA não foi concluído com sucesso.';
    case 'weak-password':
      return 'A senha é muito fraca.';
    case 'user-not-found':
      return 'Não há usuário com este e-mail.';
    case 'user-disabled':
      return 'Este usuário foi desativado.';
    case 'too-many-requests':
      return 'Muitas solicitações. Tente novamente mais tarde.';
    case 'operation-not-allowed':
      return 'Operação não permitida.';
    default:
      return 'Um erro indefinido ocorreu. Código de erro: ${error.code}';
  }
}


