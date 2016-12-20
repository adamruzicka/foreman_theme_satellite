class RemoveSatelliteFromNotificationNameSpellCorrection < ActiveRecord::Migration
  class FakeMailNotification < ActiveRecord::Base
    self.table_name = 'mail_notifications'
  end

  def up
    FakeMailNotification.where(name: 'satellite_sync_errata').each do |notification|
      new_name = 'sync_errata'
      FakeMailNotification.where(name: new_name).destroy_all
      notification.name = new_name
      notification.save!
    end
  end
end
