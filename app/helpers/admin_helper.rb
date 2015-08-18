module AdminHelper

  def admin_create_path
    if respond_to?(:parent) && parent?
      [:admin, parent, resource]
    else
      [:admin, resource]
    end
  end

end
