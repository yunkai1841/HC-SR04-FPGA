# 環境
- FPGAボード DE10-nano
- 使用センサー
HC-SR04
https://akizukidenshi.com/catalog/g/gM-11009/
- ツール Quartus 20.4

# センサー仕様
1.	10㎲の間trigをhighにする。
2.	センサーから40kHzの超音波が発射される。
3.	超音波が返ってくるまでechoがhighになる。(パルス信号)
4.	echoのパルスの時間から距離を計算できる。

# pll
pllはQuartusで自動生成
50MHz -> 5MHz変換
