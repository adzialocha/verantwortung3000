module Trackable

  extend ActiveSupport::Concern

  included do

    include PublicActivity::Model

    tracked :owner => Proc.new { |controller, model| controller.current_user ? controller.current_user : nil },
      :parameters => { :title => :title }

  end

end
