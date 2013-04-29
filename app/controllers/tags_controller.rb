class TagsController < ApplicationController
  load_and_authorize_resource
  skip_authorization_check only: :index

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(params[:tag])
    if @tag.save
      redirect_to tags_path, notice: I18n.t("flash.actions.create.notice")
    else
      render :new
    end
  end

  def update
    if @tag.update_attributes(params[:tag])
      redirect_to tags_path, notice: I18n.t("flash.actions.update.notice")
    else
      render :edit
    end
  end

  def destroy
    @tag.destroy
    redirect_to tags_path, notice: I18n.t("flash.actions.destory.notice")
  end
end
