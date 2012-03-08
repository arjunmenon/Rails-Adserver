module RailsAdserver
  class AdspacesController < ApplicationController
    helper_method :_current_user
    before_filter :authenticate
    # GET /adspaces
    # GET /adspaces.json
    def index
      @title = "Ad-Spaces"
      @adspaces = Adspace.all
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @adspaces }
      end
    end
  
    # GET /adspaces/1
    # GET /adspaces/1.json
    def show
      @adspace = Adspace.find(params[:id])
      @tile = "Ad-Space - #{@adspace.name}"
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @adspace }
      end
    end
  
    # GET /adspaces/new
    # GET /adspaces/new.json
    def new
      @title = "New Ad-Space"
      @adspace = Adspace.new
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @adspace }
      end
    end
  
    # GET /adspaces/1/edit
    def edit
      @title = "Edit Ad-Space"
      @adspace = Adspace.find(params[:id])
    end
  
    # POST /adspaces
    # POST /adspaces.json
    def create
      @title = "New Ad-Space"
      @adspace = Adspace.new(params[:adspace])
      respond_to do |format|
        if @adspace.save
          format.html { redirect_to @adspace, notice: 'Adspace was successfully created.' }
          format.json { render json: @adspace, status: :created, location: @adspace }
        else
          format.html { render action: "new" }
          format.json { render json: @adspace.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /adspaces/1
    # PUT /adspaces/1.json
    def update
      @title = "Edit Ad-Space"
      @adspace = Adspace.find(params[:id])
      respond_to do |format|
        if @adspace.update_attributes(params[:adspace])
          format.html { redirect_to @adspace, notice: 'Adspace was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @adspace.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /adspaces/1
    # DELETE /adspaces/1.json
    def destroy
      @adspace = Adspace.find(params[:id])
      @adspace.destroy
  
      respond_to do |format|
        format.html { redirect_to adspaces_url }
        format.json { head :no_content }
      end
    end
  end
end
