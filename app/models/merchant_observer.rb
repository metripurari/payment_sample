class MerchantObserver < ActiveRecord::Observer

  def before_create(object)
    object.build_token
  end
end