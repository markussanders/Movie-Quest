# Movie Queue Maker

This is a command line database application that allows users to search for movies and save those movies into their own queue.

Users are able to be created and saved in the database. Users can search for movies based on: movie title, movie actors, or movie genre. Users can add and delete movies in their queue and go through all the movies in their queue.

## Installation

### Clone

- Clone this repo to your local machine using `https://github.com/DerekTownsend/module-one-final-project-guidelines-chicago-web-051319.git`

### Setup

- After you clone, make sure you install all the ruby gems

```
$ bundle install
```

- Run the following to create and seed your database in this order

```
$ rake db:create
```

```
$ rake db:migrate
```

```
$ rake db:seed
```

###How to Run App

Run the following code to start command line database application. Make sure you are in home directory of folder.

```
$ ruby lib/run.rb
```

## Contributors

- Derek Townsend - https://github.com/DerekTownsend

- Markus Sanders - https://github.com/mksz3

- John Linatoc - https://github.com/johnlinatoc


### License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
