# Description
This is the base implementation of the attitude test: __Разработать скрипт парсинга афиши кино с портла РБ7 и вывести ТОП3 фильмов по количеству сеансов.__
The script parses the page https://rb7.ru/afisha/movie-shows and returns Top 3 movies by the sessions' amount for today.

## Requirements:
* ```$ gem install nokogiri```
* ```$ gem install httparty```
  
## To run the script:
```$ ruby scrap.rb```

### Output example:
```
Top 3 movies by amount of the sessions:

1. Райя и последний дракон - 64 sessions. 
2. Пара из будущего - 61 sessions.
3. Том и Джерри - 35 sessions.