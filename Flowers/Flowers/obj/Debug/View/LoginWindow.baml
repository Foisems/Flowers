   M S B A M L   `   `   `  ����B  >Flowers, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:Flowers.ViewFlowers.View  5   	       Flowers.View.LoginWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   ,localclr-namespace:Flowers.View     5   	   -   5          � Title$  Авторизация��5   	   $	��450��6   $	��400��6*    � WindowStartupLocation$ CenterScreen=�5	   	    � 
ResizeMode$ NoResize=�5
   	   ���#ffdbde.��5      � $��20q�6    � RowDefinitions 5   
   �� 5      �� 5      �� 5      �� 5      $��80 �6    � ColumnDefinitions 5   
   .+�5   
   �� $��Введите логин��6   $��0��5      $��1��5      $��25(�5      $��Center=�5      $	��Top=�5      �� 5   
   -   5         ��Name$ loginTB��5      $��0��5      $��1��5      $��Bottom=�5       $��19(�5!      $	��270��5"      $��0, 26q�5#      $��30��5$      �� 5%   
   $!��Введите пароль��6   $��1��5&      $��25(�5'      $��1��5(      $��Center=�5)      G� 5*   
   -   5         G�Name$ 
passwordPB��5*      $��1��5+      $��19(�5,      $	��Top=�5-      $��0, 50q�5.      $	��270��5/      $��1��50      $��2��51      $��30��52      �� 53   
   -   5         ��Name$ 
EnterAdmin��53      $��
Войти��54      $��2��55      $��1��56      $	��200��57      $��50��58      $��25(�59      5:      �� 5;   
   -   5        $ Enter��5;      $.��(Войти без авторизации��5<      $��3��5=      $��1��5>      $	��280��5?      $��50��5@      $��25(�5A      5B      5C      5D      