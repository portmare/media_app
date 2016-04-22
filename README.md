## Media collection application ##

This application allows you to authenticate users, create and share image collections. 

Steps:
 1. To register, click a button `Sign up FREE` on the index page and fill out the user's name, email and password confirmation and click a button `Sign up`. Authentication is performed using the gem `authlogic`.
 2. After registering, you will automatically pass the authentication and get to a page of their collections (albums) of media files.
 3. To add a new collection (album), click a button `Add new album` and fill out the album's name and click a button `Save`. Your album is not available for anonymous users by default. Autorization is performed using the gem `pundit`.
 4. To add media files, click a link to your album, and click a button `Add new image`, and attach file from your disk or fill out the external link to upload. This is performed using the gem `carrierwave`.
 5. To share your collection (album), click a button `Share` on the album's page to show the shared link. The album will be available for anonymous users.
 6. To close your collection (album), click a button `Close share` on the album's page. The album will be not available for anonymous users.
 7. To sign out click a button `Sign out` and you redirect to root page.
 8. For re-authentication click a button `Sign in` and fill out the user's email and password.

Any model can be made available from outside: you need to include in the model the concern `Tokenize` and create view for the action `show`.
```
# /app/models/model.rb
class Model < ActiveRecord::Base
  include Tokenize
end

# /app/views/models/show.html.slim
p 
  | Model instance is
  = object.inspect
```

The application is tested using gem `rspec-rails`.