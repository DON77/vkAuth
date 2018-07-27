# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
В файле /config/initializers/devise.rb поменять в последней строке callback_url и redirect_url на свой домен, который вы будете указывать во время создания приложения на сайте вконтакте, 6642807 - на свое айди, которое можно достать по ссылке https://vk.com/apps?act=manage , рядом с ним поменять N80XlirJqTofnYbZcSRd на свой ключ оттуда же. Не работает на localhost, то есть обьязательно запускать с сервера с публичным айпи, к которому можно подключиться везде. При первом запуске сделать rails db:create и rails db:migrate.
```ruby
  config.omniauth :vkontakte, "6642807", "N80XlirJqTofnYbZcSRd",
    callback_url: "https://salty-sea-57567.herokuapp.com/users/auth/vkontakte/callback",
    scope: 'email, photos, friends',
    image_size: 'original',
    redirect_url: 'https://salty-sea-57567.herokuapp.com/users/auth/vkontakte/callback',
    display: 'page',
    lang: 'ru',
    https: 1
``` 
* ...
