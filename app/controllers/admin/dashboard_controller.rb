class Admin::DashboardController < AdminController

  def index

    @users_count = User.count
    @productions_count = Production.count
    @events_count = Event.count
    @instruments_count = Instrument.count
    @devices_count = Device.count

  end

end
