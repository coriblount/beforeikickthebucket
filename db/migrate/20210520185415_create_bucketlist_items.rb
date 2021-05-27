class CreateBucketlistItems < ActiveRecord::Migration[6.1]
  def change
    create_table :bucketlist_items do |t|
      t.string :name
      t.string :description
      t.integer :rating
      t.integer :trip_id
      t.timestamps
    end
  end
end
