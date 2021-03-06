# coding: UTF-8

require 'minitest/autorun'
require 'hashie'
require_relative '../lib/Game.rb'

class Game_test < Minitest::Test
	attr_reader :game

	HEAL_INTERVAL = 5	# 回復間隔(分)
	COST_ONE_ROUND = 20	# 消費スタミナ/1周

	def setup
		# input用のHash
		sutamina_array = {heal_interval: HEAL_INTERVAL, cost_one_round: COST_ONE_ROUND}
		sutamina_array = Hashie::Mash.new(sutamina_array)

		@game = Game.new(sutamina_array)
	end

	# 1日で回復するスタミナ
	def test_stamina_day_recover
		assert_equal 288, game.stamina_day_recover
	end

	# 1日の周回可能回数
	def test_round_num_day
		assert_equal 14, game.round_num_day
	end
end
