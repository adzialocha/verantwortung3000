class Admin::DashboardController < AdminController

  def index

    @users_count = User.count
    @confirmed_users_count = User.where(:official => true).count
    @productions_count = Production.count
    @events_count = Event.count
    @instruments_count = Instrument.count
    @devices_count = Device.count
    @collaborations_count = Collaboration.count
    @requirements_count = Requirement.count

  end

end
