## Introduction

This the demo of using Rails Module Generator, Rails Controller Generator, JBuilder. 

This README would normally tell you what steps are necessary to get the 
application up and running.

## Demo
A live demo of creating MVC separately (Getting started with JBuilder)
#### create a new rails project
```
ChendeMacBook-Pro:RubymineProjects chen$ rails new HelloRails
ChendeMacBook-Pro:RubymineProjects chen$ cd HelloRails/
```

#### create two models: Advanced Rails model generator
```
ChendeMacBook-Pro:HelloRails chen$ rails g model Product name 'price:decimal{12,2}' active:boolean
      invoke  active_record
      create    db/migrate/20151122071318_create_products.rb
      create    app/models/product.rb
      invoke    test_unit
      create      test/models/product_test.rb
      create      test/fixtures/products.yml
ChendeMacBook-Pro:HelloRails chen$ rails g model Review product:references user rating:integer body:text
      invoke  active_record
      create    db/migrate/20151122071338_create_reviews.rb
      create    app/models/review.rb
      invoke    test_unit
      create      test/models/review_test.rb
      create      test/fixtures/reviews.yml
```

#### create a controller ‘ProductsController’ with an action ‘index’
```
ChendeMacBook-Pro:HelloRails chen$ rails g controller products index
      create  app/controllers/products_controller.rb
       route  get 'products/index'
      invoke  erb
      create    app/views/products
      create    app/views/products/index.html.erb
      invoke  test_unit
      create    test/controllers/products_controller_test.rb
      invoke  helper
      create    app/helpers/products_helper.rb
      invoke    test_unit
      invoke  assets
      invoke    coffee
      create      app/assets/javascripts/products.coffee
      invoke    scss
      create      app/assets/stylesheets/products.scss
```

In routes.rb,
get 'products/index'
When we run ‘rake routes’, we find
```
ChendeMacBook-Pro:HelloRails chen$ rake routes
        Prefix Verb URI Pattern               Controller#Action
products_index GET  /products/index(.:format) products#index
```

We modify the routes.rb, and run ‘rake routes’, we find
```
ChendeMacBook-Pro:HelloRails chen$ rake routes
  Prefix Verb URI Pattern         Controller#Action
products GET  /products(.:format) products#index
```

#### Create JSON with JBuilder:
1. Use Jbuilder.encode()
2. Create index.json.jbuilder as a template
3. format.json in respond_to function

#### Parsing JSON (works both in frontend and backend)
JSON Parsing example 
```
require "rubygems" 
require "json" 
string =
'{"desc":{"someKey":"someValue","anotherKey":"value"},"main_item":{"stats":{"a":8,"b":12,"c":10}}}' 
parsed = JSON.parse(string) # returns a hash 
p parsed["desc"]["someKey"] 
p parsed["main_item"]["stats"]["a"] 
```

#### Read JSON from a file, iterate over objects 
```
file = open("shops.json") 
json = file.read 
parsed = JSON.parse(json) 
parsed["shop"].each do |shop| 
    p shop["id"] 
end
```

### How to run the demo?
```
<tt>git clone ...</tt>
<tt>bundle install</tt>
<tt>rake db:migrate</tt>
<tt>rake db:seed</tt>
<tt>rails s</tt>
```
see two URL:
1. `http://localhost:3000/products.json`
this is the JSON file formatted by index.json.jbuilder template
2. `http://localhost:3000/products`
In this page, we can see two way of diaplaying things provided by action. First one is displayed through objects. Second one is displayed through JSON file created by Jbuilder.encode().

### Reference
[Building Your First Rails Application: Models](http://www.sitepoint.com/building-your-first-rails-application-models/)

[Building Your First Rails Application: Views and Controllers](http://www.sitepoint.com/building-your-first-rails-application-views-and-controllers/)

[JSON formatter](https://jsonformatter.curiousconcept.com/#)

[Clean JSON generation with JBuilder](http://samurails.com/gems/jbuilder/)

[Ruby: Reading a .json File to Hash](https://hackhands.com/ruby-read-json-file-hash/)

[Getting started with JBuilder](https://richonrails.com/articles/getting-started-with-jbuilder)

