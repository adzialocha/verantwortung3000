class Admin::DashboardController < AdminController

  def index

    @users_count = User.count
    @confirmed_users_count = User.where(:official => true).count

    @productions_count = Production.count
    @events_count = Event.count

    @instruments_count = Instrument.count
    @devices_count = Device.count
    @collaborations_complete_count = Collaboration.all_complete.count
    @requirements_complete_count = Requirement.all_complete.count
    @collaborations_incomplete_count = Collaboration.all_uncomplete.count
    @requirements_incomplete_count = Requirement.all_uncomplete.count

    @images_count = Image.count
    @activities_count = PublicActivity::Activity.count

  end

end
