import 'package:bind/domain/model/enum/currency.dart';

enum ApiCurrency {
  usd,
  eur,
}

const currencyValues = {
  ApiCurrency.usd: 'usd',
  ApiCurrency.eur: 'eur',
};

Currency mapCurrency(ApiCurrency currency) {
  switch (currency) {
    case ApiCurrency.usd:
      return Currency.usd;
    case ApiCurrency.eur:
      return Currency.eur;
  }
}

String getCurrency(Currency currency) {
  switch (currency) {
    case Currency.usd:
      return 'USD';
    case Currency.eur:
      return 'EUR';
  }
}
