# -*- coding: utf-8 -*-
Plugin.create(:mikutter_gameboy) do

	command(
		:tweet_gameboy,
		name: 'N天堂ゲームボーイ',
		condition: -> _ { true },
		visible: true,
		role: :timeline
		) do
		Post.primary_service.update(message: make_strs())
	end

	def make_strs(strs = "")
		title_strs = ["N","i","n","t","e","n","d","o"]
		cr_str = "®"
		balloon_str = "＜"
		message_strs = ["ﾎﾟﾘｰﾝ","ﾎﾟﾘｰnﾌﾟﾂｯ…","ｼﾞｮﾘﾞﾝﾞ…","…"]
		error_strs = ["░","▒","▓","█","┏","┳","┻","┓","͇̫͚ͪ͊"]

		title_strs.each do |str|
			if (rand(2) + 1) == 1
				strs << str
			else
				strs << error_strs[rand(error_strs.size)]
			end
		end
		return strs << cr_str << balloon_str << message_strs[rand(message_strs.size)]
	end
end