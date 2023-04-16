#!/bin/bash

api="https://invest.divweb.ru/api"
sign=null
vk_user_id=null
vk_ts=null
vk_ref=null
user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36"

function authenticate() {
	# 1 - sign: (string): <sign>
	# 2 - vk_user_id: (integer): <vk_user_id>
	# 3 - vk_ts: (integer): <vk_ts>
	# 4 - vk_ref: (string): <vk_ref>
	# 5 - access_token_settings: (string): <access_token_settings - default: >
	# 6 - are_notifications_enabled: (integer): <are_notifications_enabled: default: 0>
	# 7 - is_app_user: (integer): <is_app_user - default: 0>
	# 8 - is_favorite: (integer): <is_favorite - default: 0>
	# 9 - language: (string): <language - default: ru>
	# 10 - platform: (string): <platform - default: desktop_web>
	sign=$1
	vk_user_id=$2
	vk_ts=$3
	vk_ref=$4
	params="vk_access_token_settings=${5:-}&vk_app_id=7689931&vk_are_notifications_enabled=${6:-0}&vk_is_app_user=${7:-0}&vk_is_favorite=${8:-0}&vk_language=${9:-ru}&vk_platform=${10:-desktop_web}&vk_ref=$vk_ref&vk_ts=$vk_ts&vk_user_id=$vk_user_id&sign=$sign"
	echo $params
}

function get_account_info() {
	curl --request GET \
		--url "$api/profile/?$params" \
		--user-agent "$user_agent"
}

function get_stocks_home() {
	curl --request GET \
		--url "$api/stocks/home/?$params" \
		--user-agent "$user_agent"
}

function get_top_communities() {
	# 1 - top_filter: (string): <top_filter>
	curl --request GET \
		--url "$api/top/communities/?$params&top_filter=$1" \
		--user-agent "$user_agent"
}

function get_top_users() {
	# 1 - top_filter: (string): <top_filter>
	curl --request GET \
		--url "$api/top/users/?$params&top_filter=$1" \
		--user-agent "$user_agent"
}

function get_top_dons() {
	# 1 - top_filter: (string): <top_filter>
	curl --request GET \
		--url "$api/top/dons/?$params&top_filter=$1" \
		--user-agent "$user_agent"
}

function get_shop_raffles() {
	curl --request GET \
		--url "$api/shop/raffles/?$params" \
		--user-agent "$user_agent"
}

function get_transactions() {
	curl --request GET \
		--url "$api/transactions/?$params" \
		--user-agent "$user_agent"
}

function get_referral_info() {
	curl --request GET \
		--url "$api/referral_info/?$params" \
		--user-agent "$user_agent"
}

function get_badges() {
	curl --request GET \
		--url "$api/badges/?$params" \
		--user-agent "$user_agent"
}

function get_achievements() {
	curl --request GET \
		--url "$api/achievements/?$params" \
		--user-agent "$user_agent"
}

function get_exchange_rate() {
	curl --request GET \
		--url "$api/exchange-rate/?$params" \
		--user-agent "$user_agent"
}

function get_user_farms() {
	curl --request GET \
		--url "$api/user-farms/?$params" \
		--user-agent "$user_agent"
}

function get_farms() {
	curl --request GET \
		--url "$api/farms/?$params" \
		--user-agent "$user_agent"
}

function buy_farm() {
	# 1 - farm_id: (integer): <farm_id>
	curl --request POST \
		--url "$api/buy-farm/" \
		--user-agent "$user_agent" \
		--data '{
			"farm_id": '$1',
			"params": "'?$params'"
		}'
}

function collect_money() {
	# 1 - currency_type: (string): <currency_type>
	curl --request POST \
		--url "$api/collect-money/?$params" \
		--user-agent "$user_agent" \
		--data '{
			"currency_type": "'$1'"
		}'
}

function buy_currency() {
	# 1 - currency_type: (string): <currency_type>
	# 2 - amount: (integer): <amount>
	curl --request POST \
		--url "$api/buy-currency/?$params" \
		--user-agent "$user_agent" \
		--data '{
			"currency_type": "'$1'",
			"amount": '$2'
		}'
}


function get_stocks() {
	# 1 - filter: (string): <filter>
	curl --request GET \
		--url "$api/stocks/?$params&filter=$1" \
		--user-agent "$user_agent"
}

function get_bonuses() {
	curl --request GET \
		--url "$api/bonuses/?$params" \
		--user-agent "$user_agent"
}

function get_ad_bonus() {
	curl --request POST \
		--url "$api/bonuses/ad?$params" \
		--user-agent "$user_agent" \
		--data '{}'
}
