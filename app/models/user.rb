class User < ActiveRecord::Base #case sensitive, ignore the capitilize letter, so Joe is the same as joe
   validates :username, 
             presence: true, 
             uniqueness: {case_sensitive: false},
             length: {minimum:3, maximum:25}
   
   #search for email regular expression, with the expression, u can verify if an email is valid ou not          
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   
   validades :email, 
             presence:true,
             uniqueness: {case_sensitive:false}, 
             format: {with: VALID_EMAIL_REGEX}
end