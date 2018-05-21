# Kajidemo

Rails App imitates a Housekeeping Service Web site.

* Ruby version: 2.5.0 ~ 2.5.1(Change Gemfile depending on situation)

## Setup
- Clone and bundle install

```
$ git clone https://github.com/DialBird/kaji_demo.git
$ cd kaji_demo && bundle install --path vendor/bundle
```

- Add `.env` file and setup BASIC AUTHENTICATION (__Required!__)

```sh
# Example
BASIC_USERNAME=user
BASIC_PASSWORD=password
```

- Run the app

```
$ rails s
```
