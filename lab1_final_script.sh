#!/bin/bash
cd ~/lab0
cd claude_monet
mkdir hall
cd hall
mkdir tables
cd tables 
cat << 'EOF' > table_three
За третьим столиком ждут двух гостей
Гости заказали салат и горячее блюдо
Настя передала заказ на кухню
Счёт попросили принести после десерта
EOF
cat << 'EOF' > table_seven
Седьмой столик забронирован на вечер
Постоянные гости попросили старое меню
Костя готовит для них напитки
Настя проверяет заказ перед подачей
EOF
cd ..
mkdir waiters
cd waiters
cat << 'EOF' > shift_list
Настя обслуживает центральную часть зала
Саша работает у столиков возле окна
Первая смена начинается до открытия
После банкета официанты помогают закрыть зал
EOF
cat << 'EOF' > tip_report
Третий столик оставил хорошие чаевые
Гости у окна поблагодарили Настю
На банкете чаевые разделили между официантами
Итоговый отчёт передали Вике
EOF
cd ~/lab0/claude_monet/hall
cat << 'EOF' > guest_requests
Один гость просит блюдо без лука
Для ребёнка нужен небольшой десерт
Постоянный гость хочет поговорить с Бариновым
Настя уточняет каждый особый заказ
EOF
cd ~/lab0/claude_monet
mkdir kitchen
cd ~/lab0/claude_monet/kitchen
cat << 'EOF' > vegetarian_menu
Овощной салат для Насти
Рататуй по рецепту Баринова
Тёплая закуска без мяса
Фруктовый десерт от Луи
EOF
cat << 'EOF' > barinov_order
Все заказы передавать на кухню без задержки
Новое блюдо показывать шефу перед подачей
Настя отвечает за пожелания важных гостей
После смены подготовить общий отчёт
EOF
cd ~/lab0/claude_monet
mkdir office
cd ~/lab0/claude_monet/office
cat << 'EOF' > vika_instruction
Вика собирает официантов перед открытием
Настя проверяет готовность столиков
Во время смены жалобы записывают сразу
Вечером отчёты передают управляющей
EOF
cd ~/lab0
mkdir nastya_room
cd ~/lab0/nastya_room
cat << 'EOF' > nastya_diary
Настя пришла в ресторан вместе с Костей
До открытия она помогла украсить зал
Постоянные гости узнали Настю
После смены Костя ждал её у бара
EOF
cd ~/lab0
mkdir free_tables
cat << 'EOF' > evening_message
Сегодня в ресторане проходит большой банкет
Настя назначена старшей среди официантов
Вика проверит зал в шесть часов
Баринов ждёт первые заказы на кухне
EOF
cd ~/lab0
chmod 755 claude_monet
chmod 750 claude_monet/hall/tables
chmod 700 free_tables
chmod u=rwx,g=rx,o= claude_monet/hall
chmod u=rwx,g=rx,o=rx claude_monet/kitchen
chmod u=rwx,g=rx,o= nastya_room
chmod u=rwx,g=rx,o= claude_monet/hall/waiters
chmod 640 claude_monet/hall/tables/table_seven
chmod 660 claude_monet/hall/waiters/shift_list
chmod 640 claude_monet/kitchen/barinov_order
chmod 640 nastya_room/nastya_diary
chmod u=rw,g=r,o= claude_monet/hall/tables/table_three
chmod u=rw,g=r,o=r claude_monet/hall/waiters/tip_report
chmod u=rw,g=r,o=r claude_monet/hall/guest_requests
chmod u=r,g=r,o=r claude_monet/kitchen/vegetarian_menu
chmod u=rw,g=r,o= claude_monet/office/vika_instruction
chmod u=rw,g=r,o=r evening_message
cp nastya_room/nastya_diary claude_monet/office/waitress_report
cp -r claude_monet/hall/tables claude_monet/hall/tables_backup
ln -s ../claude_monet/hall/guest_requests nastya_room/today_requests
ln -s claude_monet/hall hall_entry
ln evening_message claude_monet/hall/shift_message
cat claude_monet/hall/tables/table_three claude_monet/hall/tables/table_seven > claude_monet/hall/reservation_plan
cat claude_monet/office/vika_instruction >> claude_monet/hall/waiters/shift_list
mv claude_monet/hall/waiters/tip_report claude_monet/office/evening_tips
ls -lR | grep "^-" | sort -n -k5 | tail -n 5
grep -r -h -E -i "настя|гост" claude_monet/ nastya_room/ | grep -v -i "постоянн" | sort | head -n 6
grep -l -r -i "гост" claude_monet/hall/tables/ claude_monet/hall/tables_backup/ | wc -l
tail -q -n +1 claude_monet/hall/tables/* | sed -n '1p;$p' | grep -E -i "столик|заказ" | sort -r
cat claude_monet/hall/reservation_plan | grep -v "Настя" | grep -E -i "гост|столик" | sort -r | head -n 4 | wc -w
ls -lR | grep "^-" | awk '$2 == 2 {print $0}' | sort -r -k9
ls -lR | grep "^l" | sort -k9 | tail -n 1
rm nastya_room/nastya_diary
rm nastya_room/today_requests
rm hall_entry
rm evening_message
rm claude_monet/hall/shift_message
rm claude_monet/kitchen/barinov_order
rmdir free_tables
rm -rf claude_monet/hall/tables_backup
