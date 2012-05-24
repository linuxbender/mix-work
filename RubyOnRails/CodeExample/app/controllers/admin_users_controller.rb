################################################
# controller admin_users
# daniel glenn <glenn@starwolf.ch>
#
# controller behandelt in der app - das erstellen zeigen und löschen von
# admin users => aufgebaut nach der REST/CRUD idee
#
# 05.06.2011 init controller
# 12.06.2011 erweitert mit löschen
# 19.06.2011 erweitert mit list sort
# 10.07.2011 nochmals angeschaut und formatierung angepasst wegen neuer version
# von gmate
################################################
class AdminUsersController < ApplicationController
  # admin layout setzten
  layout 'admin'
  # Todo: ausprobieren ob logger geht
  before_filter :confirm_logged_in

  # action populate list on index
  def index
    list
    render('list')
  end

  # action sort nach admin
  def list
    @admin_users = AdminUser.sorted
  end

  # action request new admin user
  def new
    @admin_user = AdminUser.new
  end

  # action erstellen new admin user
  def create
    @admin_user = AdminUser.new(params[:admin_user])
    if @admin_user.save
      flash[:notice] = 'Admin wurde erstellt!'
      # redirection über action
      redirect_to(:action => 'list')
    else
      render("new")
    end
  end

  # action edit admin user
  # param admin user id
  def edit
    @admin_user = AdminUser.find(params[:id])
  end

  # action update admin
  # param admin user id
  def update
    @admin_user = AdminUser.find(params[:id])
    if @admin_user.update_attributes(params[:admin_user])
      flash[:notice] = 'Update ausgeführt!'
      redirect_to(:action => 'list')
    else
      render("edit")
    end
  end

  # action  delete
  # param admin user id
  def delete
    @admin_user = AdminUser.find(params[:id])
  end

  # action destroy
  # param admin user id
  def destroy
    AdminUser.find(params[:id]).destroy
    flash[:notice] = "löschen ausgeführt!"
    # redirection über action
    redirect_to(:action => 'list')
  end

end # end of class

