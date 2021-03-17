class MatchSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :match_type, :score, :result, :date, :surface, :notes
end
