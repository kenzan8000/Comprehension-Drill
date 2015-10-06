# Model

## add encryption settings
```
$ vim config/encryption.yml
```

```yml
development:
  app_secret: 'hoge'
  key: '01234567890123456789012345678901'
  iv: '0123456789012345'

test:
  app_secret: 'hoge'
  key: '01234567890123456789012345678901'
  iv: '0123456789012345'

production:
  app_secret: 'hoge'
  key: '01234567890123456789012345678901'
  iv: '0123456789012345'
```
Use 1 byte character.
key is 256 bits. (UTF-8)
iv is 128 bits. (UTF-8)

## generate model
```
$ rails generate model ModelName hoge_fuga:integer foo_bar:integer
```

## migration
```
$ rake db:migrate
```


# Controller

## generate controller
```
$ rails generate controller your_controller_name
```


# Heroku

## cron
```
$ # local manual
$ rails runner Tasks::ScrapingArticlesTask.execute
$
$ # heroku manual
$ heroku run rails runner Tasks::ScrapingArticlesTask.execute
$
$ # heroku scheduler
$ heroku addons:create scheduler:standard
$ heroku run rake task_name
$ heroku addons:open scheduler
```


## create an app on Heroku
```
$ bundle exec heroku create YOUR_APP
```

## PostgreSQL setting
```
$ heroku addons:add heroku-postgresql --app YOUR_APP
$ heroku config --app YOUR_APP
=== herokuapp Config Vars
DATABASE_URL:                  postgres://〜
HEROKU_POSTGRESQL_(COLOR)_URL: postgres://〜
....
$ heroku pg:promote HEROKU_POSTGRESQL_(COLOR)_URL --app YOUR_APP
```

## deploy Heroku
```
$ git push heroku master
$ heroku run rake db:migrate
$ bundle exec heroku open
```
