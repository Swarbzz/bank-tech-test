# Bank tech test

A practice test given to me during my time at Maker's Academy. It focuses on making good, clean code while adhearing to the rule of OO. 

## What the code does

[Click here](https://github.com/makersacademy/course/blob/master/individual_challenges/bank_tech_test.md) for the brief.

## How to install 

From your command line, please copy the below

```ruby
git clone git@github.com:Swarbzz/bank-tech-test.git
```
Then run bundle install

```ruby
bundle install
```

## How to use through irb

```ruby
$ require "./lib/account"
$ account = Account.new
$ account.deposit(50.00)
$ account.withdraw(22.00)
$ puts account.statement
```