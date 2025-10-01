class DocsController < ApplicationController
    before_action :find_doc, only: [:show, :edit, :update, :destroy]
    # The above line ensures that the find_doc method is called before the specified actions.
    # This method retrieves the Doc object based on the ID passed in the parameters.


    def index
        @docs = Doc.all
        # The above line retrieves all Doc objects from the database and assigns them to the @docs instance variable.
        # This variable is used in the index view to display a list of documents.
    end

    def show
        @doc = Doc.find(params[:id])
        # The above line finds a specific Doc object by its ID, which is passed in the parameters.
        # This object is then used in the show view to display the details of the document.
    end

    def new
        @doc = Doc.new
        # The above line initializes a new Doc object for the form in the new view.
    end

    def create
        @doc = Doc.new(doc_params)
        if @doc.save
            redirect_to @doc, notice: 'Doc was successfully created.'
        else
            render :new
        end
    end

    def edit
        @doc = Doc.find(params[:id])
        # The above line retrieves the Doc object that is being edited based on the ID passed in the parameters.
        # This object is then used in the edit view to populate the form with existing data.
    end

    def update
        @doc = Doc.find(params[:id])
        if @doc.update(doc_params)
            redirect_to @doc, notice: 'Doc was successfully updated.'
        else
            render :edit
        end
        # The above code finds the Doc object by ID and updates it with the parameters from the form.
    end

    def destroy
        @doc = Doc.find(params[:id])
        @doc.destroy
        redirect_to docs_path, notice: 'Doc was successfully deleted.'
        # The above code finds the Doc object by ID and deletes it from the database.
        # After deletion, it redirects to the index page with a success message.
        
    end

    
    private

    def find_doc
        @doc = Doc.find(params[:id])
        # This method retrieves the Doc object based on the ID passed in the parameters.
        # It is typically used in actions like show, edit, update, and destroy.
    end

    def doc_params
        params.require(:doc).permit(:title, :content)
        # This method ensures that only the title and content attributes can be set through the form.
    end

end
