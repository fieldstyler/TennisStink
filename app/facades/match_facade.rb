class MatchFacade

  attr_reader :params
  def initialize(params)
    @match_type = params[:match_type]
    @result = params[:result]
    @surface = params[:surface]
  end

  def filter
    if !@match_type.nil? && !@result.nil? && !@surface.nil?
      Match.where(match_type: @match_type, result: @result, surface: @surface)
    elsif !@match_type.nil? && !@result.nil? && @surface.nil?
      Match.where(match_type: @match_type, result: @result)
    elsif !@match_type.nil? && @result.nil? && !@surface.nil?
      Match.where(match_type: @match_type, surface: @surface)
    elsif @match_type.nil? && !@result.nil? && !@surface.nil?
      Match.where(result: @result, surface: @surface)
    elsif !@match_type.nil? && @result.nil? && @surface.nil?
      Match.where(match_type: @match_type)
    elsif @match_type.nil? && !@result.nil? && @surface.nil?
      Match.where(result: @result)
    elsif @match_type.nil? && @result.nil? && !@surface.nil?
      Match.where(surface: @surface)
    end
  end
  # def filter_by_surface
  #   Match.where(surface: @surface)
  # end


end
