# Write your code here.
def dictionary
  {
    "hello" => "hi",
    "to" => "2",
    "two" => "2",
    "too" => "2",
    "for" => "4",
    "For" => "4",
    "four" => "4",
    "be" => "b",
    "you" => "u",
    "at" => "@",
    "and" => "&"
  }
end

def word_substituter(string)
  start_tweet = string.split(" ")
  new_tweet = start_tweet
  dictionary_keys = dictionary.keys

  new_tweet.each do |word|
    dictionary_keys.each do |key|
      if key == word
        index = new_tweet.index(word)
        new_tweet.delete_at(index)
        new_tweet.insert(index, dictionary[key])
      end
    end
  end
  new_tweet.join(" ")
end

def bulk_tweet_shortener(tweets)
  new_tweets = []
  x = 0
    tweets.each do |tweet|
      new_tweets << word_substituter(tweet)
      puts new_tweets[x]
      x += 1
    end
end

def selective_tweet_shortener(tweet)
  if tweet.length > 140
    word_substituter(tweet)
  else
    tweet
  end
end

def shortened_tweet_truncator(tweet)
new_tweet = ""

  if tweet.length > 140
    new_tweet = word_substituter(tweet)
  else
    new_tweet = tweet
  end

  if new_tweet.length > 140
    new_tweet = new_tweet[0..136] + "..."
  end

new_tweet
end
