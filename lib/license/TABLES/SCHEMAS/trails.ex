defmodule License.Database.Schema.Trails do
  use LicenseWeb, :universal

  schema "trails" do
    field :narration, :string
    field :username, :string
    field :ip_address, :string
    field :actionType, :string
    field :reference, :string
    field :description, :string
    belongs_to :users, User, foreign_key: :user_id, type: :id

    timestamps(inserted_at: :created_at, type: :utc_datetime)
  end
end