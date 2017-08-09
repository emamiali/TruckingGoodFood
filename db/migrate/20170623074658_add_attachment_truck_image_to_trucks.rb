class AddAttachmentTruckImageToTrucks < ActiveRecord::Migration
  def self.up
    change_table :trucks do |t|
      t.attachment :truck_image
    end
  end

  def self.down
    remove_attachment :trucks, :truck_image
  end
end
