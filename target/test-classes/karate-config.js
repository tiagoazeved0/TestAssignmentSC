function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    baseUrl: 'https://petstore.swagger.io/v2/',
    faker: Java.type('com.github.javafaker.Faker')
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
    config.baseUrl = 'https://petstore.swagger.io/v2/'
  }
  return config;
}