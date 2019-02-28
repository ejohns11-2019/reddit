class SubsController < ApplicationController
  #Views is for user interaction
    #logic should be minimal, only logic for display
  #Controller and some of routes direct traffic, actions
    #telling where to go, defining predefined items
  #Models - all logic on the table/record-> associations,validations, classes, instance

  #SKINNY controllers and FAT Models
  #shows all of the items in the model:

  #READS/GET
  # index @model_name_plural = Model_name.all
    #in index need to find all of something


  #edit @model_name = Model_name.find(params[:id])
    #search for particular record to update
    #renders the edit form

  #show @model_name = Model_name.find(params[:id])
    #search record, shows a single record

  #new @model_name = Model_name.new
    #creates a record in memory (not in database)
    #renders the new form to create a new record

  #CREATE / Post
  #CREATE Model_name.create(model_name_params)
    #@model_name = Model_name.new(model_name_params)
    # if@model_name.save
    #   do something
    # else
    #   render :new
    # end
    #create with all the params
    #Posts onto database

  #UPDATE / Put/Patch
  #update Model_name.find(params[:id]).update(model_name_params)
    # @model_name = Model_name.find(params[:id])
    # if @model_name.update(model_params)
    #   do something
    # else
    #   render :edit
    # end
    #search for a specific model to update
    #and update with the specific params of the model

  #Destroy / Delete
  #destroy Model_name.find(params[:id]).destroy
    #redirect_to
    #find record looking for and delete

#need to define model_name_params
  #private
    # def model_name_params
    #   params.require(:model_name.permit(:name, :phone, :phone)
    # end

  before_action :find_sub, only: [:show, :update, :edit, :destroy]
  # before_action :find_sub, except: [:index, :new, :create]

  def index
    @subs = Sub.all
  end

  def show
    # @sub  = Sub.find(params[:id])
  end

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      redirect_to subs_path
    else
    render :new
  end

  def edit
    # @sub = Sub.find(params[:id])
  end

  def update
    # @sub = Sub.find(params[:id])
    if @sub.update(sub_params)
      redirect_to @sub #redirects to show the specific record
    else
      render :edit
    end
  end

  def destroy
    # Sub.find(params[:id]).destroy
    @sub.destory
    redirect_to subs_path
  end

private
  def sub_params
    params.require(:sub).permit(:name)
  end

  #only want in context of this particular file
  #so put in private section
  def find_sub
    @sub = Sub.find(params[:id])
  end

end

#repeating Sub.find(params[:id]) so should use
#Callbacks: before_action
# =>        after_action
# =>        skip_before_action
# =>        skip_after_action
