enum EnumEnv {
  dev('DEV'),
  prod('PROD'),
  uat('UAT'),
  protocol('PROTOCOL'),
  host('HOST'),
  basePath('BASE_PATH'),
  appVersion('APP_VERSION');

  final String value;

  const EnumEnv(this.value);
}
