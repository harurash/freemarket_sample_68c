# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :nickname            ,null: false
      t.string :famiry_name         ,null: false
      t.string :first_name          ,null: false
      t.string :famiry_name_kana    ,null: false
      t.string :first_name_kana     ,null: false
      
      t.integer :birthday_y         ,null: false
      t.integer :birthday_m         ,null: false
      t.integer :birthday_d         ,null: false
      
      t.integer :image
      t.text :profile

      # 謎
      t.integer :status 
      

      t.integer :postal_code        ,null:false
      t.string :adress_prefecture   ,null:false
      t.string :adress_town         ,null:false
      t.string :adress_number       ,null:false
      t.string :adress_name
      
      t.integer :phonenumber

      t.datetime :delete_at

      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
