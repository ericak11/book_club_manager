class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.integer :host_id
      t.integer :cohost_id
      t.integer :rank
    end
  end
end
