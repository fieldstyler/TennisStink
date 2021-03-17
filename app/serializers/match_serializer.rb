class MatchSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :type, :score, :result, :date, :surface, :notes
end
