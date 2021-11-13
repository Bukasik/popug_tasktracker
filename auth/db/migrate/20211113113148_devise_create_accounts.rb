# frozen_string_literal: true

class DeviseCreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      enable_extension 'pgcrypto'
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      t.uuid :public_id, default: "gen_random_uuid()", null: false

      ## Account information
      t.string   :full_name
      t.string   :position

      ## Account information
      t.boolean   :active, default: true

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at
      t.datetime :disabled_at
    end

    add_index :accounts, :email,                unique: true
    add_index :accounts, :reset_password_token, unique: true
    # add_index :accounts, :confirmation_token,   unique: true
    # add_index :accounts, :unlock_token,         unique: true
  end
end
