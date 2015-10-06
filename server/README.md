# Model

## add encryption settings
```
$ vim config/encryption.yml
```

```yml
development:
  app_secret: 'hoge'
  password: 'fuga'

test:
  app_secret: 'hoge'
  password: 'fuga'

production:
  app_secret: 'hoge'
  password: 'fuga'
```

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
