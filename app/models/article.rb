class Article < ActiveRecord::Base
    
    #belongs_to associations must use the singular term. 
    #If you used the pluralized form in the above example for the author association
    #in the Book model, you would be told that there was an 
    #"uninitialized constant Book::Authors". 
    #This is because Rails automatically infers the class name from the association name.
    #If the association name is wrongly pluralized, 
    #then the inferred class will be wrongly pluralized too.
    belongs_to :user
    has_many :article_categories
    has_many :categories, through: :article_categories 
    
    validates :title, presence: true, length: {maximum: 50, minimum: 3}
    validates :description, presence: true, length: {minimum: 10}
    #enforce that the article must have an user ID
    validates :user_id, presence: true
end

