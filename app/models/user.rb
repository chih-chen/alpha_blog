class User < ActiveRecord::Base #case sensitive, ignore the capitilize letter, so Joe is the same as joe
   
   # dependent: :destroy says that when the user is deleted, all their article will also be deleted
   has_many :articles, dependent: :destroy
   
   
   #performs an action before saving into the database, turn into downcase
   before_save {self.email = email.downcase}
   validates :username, 
             presence: true, 
             uniqueness: {case_sensitive: false},
             length: {minimum:3, maximum:25}
   
   #search for email regular expression, with the expression, u can verify if an email is valid ou not          
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   
   validates :email, 
             presence:true,
             uniqueness: {case_sensitive:false}, 
             format: {with: VALID_EMAIL_REGEX}
             
   has_secure_password
end