class TeamsController < ApplicationController

  def league
    @path = root_path
    @league_teams = Team.all
    @teams = set_sorted @league_teams
  end

  def eastern
    @path = eastern_path
    @eastern_teams = Team.eastern
    @teams = set_sorted @eastern_teams
  end

  def western
    @path = western_path
    @western_teams = Team.western
    @teams = set_sorted @western_teams
  end

  private

  def set_sorted teams
    case params[:sort]
      when "by_wins"
        teams.sort_by_wins
      when "by_losses"
        teams.sort_by_losses
      when "by_nickname"
        teams.sort_by_nickname
      when "by_city"
        teams.sort_by_city
      when "by_win_rate"
        teams.sort_by_win_rate
      else
        teams
      end   
  end
end
