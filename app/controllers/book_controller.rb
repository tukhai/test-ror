class BookController < ApplicationController
	layout 'standard'
	def list
		@books = Book.all # list of all the books in the database
		@subjects = Subject.all
    end
   
    def show
    	@book = Book.find(params[:id]) #find only the book that has the id defined in params[:id].
    end
   
    def new # create a new objec
    	@book = Book.new # called when you will display a page to the user to take user input
    	puts "Hello #{Book.all.length}"
    	puts "Hello #{Subject.all.length}"
   		@subjects = Subject.all #grabs all the subjects from the database and puts them in an array called @subjects
    end

    def book_params
	    params.require(:books).permit(:title, :price, :subject_id, :description)
	end
   
    def create # create a record into the database
    	@book = Book.new(book_params)
	
	    if @book.save
	        redirect_to :action => 'list'
	    else
	        @subjects = Subject.all
	        render :action => 'new'
	    end
    end
   
    def edit
    	@book = Book.find(params[:id])
   		@subjects = Subject.all
    end

    def book_param
	    params.require(:book).permit(:title, :price, :subject_id, :description)
	end
   
    def update
    	@book = Book.find(params[:id])
	
	    if @book.update_attributes(book_param)
	        redirect_to :action => 'show', :id => @book
	    else
	        @subjects = Subject.all
	        render :action => 'edit'
	    end
    end
   
    def delete
    	Book.find(params[:id]).destroy
   		redirect_to :action => 'list'
    end

    def show_subjects
	    @subject = Subject.find(params[:id])
	end
end
