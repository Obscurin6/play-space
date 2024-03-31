extends Control

# Инициализация начальных параметров
var player_money = 1000
var player_inventory = {"item1": 0, "item2": 0}
var market_inventory = {"item1": 50, "item2": 50}
var market_prices = {"item1": 10, "item2": 15}

# Функция для покупки товара игроком
func buy_item(item, price):
	if player_money >= price and item in market_inventory and market_inventory[item] > 0:
		player_money -= price
		player_inventory[item] += 1
		market_inventory[item] -= 1
		update_interface()
		print("Покупка товара", item, "совершена.")

# Функция для продажи товара игроком
func sell_item(item, price):
	if item in player_inventory and player_inventory[item] > 0:
		player_money += price
		player_inventory[item] -= 1
		market_inventory[item] += 1
		update_interface()
		print("Продажа товара", item, "совершена.")

# Функция обновления интерфейса
func update_interface():
	$PlayerWalletLabel.text = "Кошелек игрока: $" + str(player_money)
	$PlayerInventoryList.clear()
	$MarketInventoryList.clear()
	
	for item in player_inventory:
		$PlayerInventoryList.add_item(item + ": " + str(player_inventory[item]) + " - $" + str(market_prices[item]))
	
	for item in market_inventory:
		$MarketInventoryList.add_item(item + ": " + str(market_inventory[item]) + " - $" + str(market_prices[item]))

# Обработчик нажатия кнопки "Купить"
func _on_buy_button_pressed():
	var selected_index = $MarketInventoryList.get_selected_index()
	if selected_index != -1:
		var selected_item = $MarketInventoryList.get_item_text(selected_index)
		var item_price = market_prices[selected_item]
		buy_item(selected_item, item_price)
		print("Нажата кнопка 'Купить'.")

# Обработчик нажатия кнопки "Продать"
func _on_sell_button_pressed():
	var selected_index = $PlayerInventoryList.get_selected_index()
	if selected_index != -1:
		var selected_item = $PlayerInventoryList.get_item_text(selected_index)
		var item_price = market_prices[selected_item]
		sell_item(selected_item, item_price)
		print("Нажата кнопка 'Продать'.")

# Устанавливаем сигналы для кнопок в пользовательском интерфейсе при загрузке сцены
