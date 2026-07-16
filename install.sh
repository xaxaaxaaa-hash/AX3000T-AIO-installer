# Обновление базовых пакетов (быстрое)+русификация
apk update && apk upgrade && apk add luci-i18n-base-ru || {
    echo "Ошибка установки базовых пакетов. WAN подключен? Ебало провайдера представили?"
    exit 1
}

# Скачивание и установка темы Aurora
cd /tmp || exit 1
uclient-fetch -O luci-theme-aurora.apk https://github.com/eamonxg/luci-theme-aurora/releases/latest/download/luci-theme-aurora-1.1.0-r20260711.apk || {
    echo "Ошибка загрузки темы Aurora. Интернет есть?"
    exit 1
}
apk add --allow-untrusted luci-theme-aurora.apk || {
    echo "Ошибка установки темы Aurora"
    exit 1
}

# Установка sing-box-extended
uclient-fetch -O sing-box-extended.apk https://github.com/shtorm-7/sing-box-extended/releases/download/v1.13.14-extended-2.5.1/sing-box-extended_1.13.14-extended-2.5.1_openwrt_aarch64_cortex-a53.apk || {
    echo "Ошибка загрузки sing-box-extended. Есть 22 мегабайта?"
    exit 1
}
apk add --allow-untrusted sing-box-extended.apk || {
    echo "Ошибка установки sing-box-extended"
    exit 1
}

# Очистка
rm -f /tmp/*.apk

# Установка netshift (основной скрипт)
sh <(wget -O - https://raw.githubusercontent.com/yandexru45/netshift/refs/heads/main/install.sh) || {
    echo "Ошибка установки netshift"
    exit 1
}

echo "Все компоненты успешно установлены!"
