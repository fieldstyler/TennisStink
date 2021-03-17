class PlayerSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name, :ranking, :location, :username
end
