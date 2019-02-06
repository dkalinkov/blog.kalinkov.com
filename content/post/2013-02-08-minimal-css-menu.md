---
author: dimitar_kalinkov
title: "Минималистично CSS меню"
date: 2013-02-08T00:00:00+02:00
draft: false
categories:
- CSS
tags:
- CSS
#url: /2013/01/27/minimal-css-menu
---

Дойде време да напиша първата си по-сериозна статия. Тъй като един мой приятел ме помоли да му покажа как да си направи стилно уеб меню, реших да направя туториал от който не само той ще има полза, а всички който четат блога ми или ще го четат някога... Да не забравяме, че изпита на **Telerik Academy** по **CSS** наближава, така че все някой ще има полза от публикацията ми. Поради факта, че съм голям фен на **минималистичното** изкуство ще си направим именно такова меню. 

Ето към какъв резултат се стремим -> [DEMO](http://jsfiddle.net/dkalinkov93/TFUFG/20)

<img src="/images/minimal-flat-css-menu/menu-look.png" style="display: block; margin: auto">

Най-напред ще свържем CSS файла с HTML документа:

``` html
<head>
    <meta charset="utf-8" /> 
    <title>Minimalistic Dropdown Menu</title> 
    <link href="css/style.css" rel="stylesheet" type="text/css" /> 
</head>
```

След това самия HTML код за нашето меню:

``` html
<body>
   <section>
      <ul>
         <li><a href="#">Menu Item 1</a></li>
         <li>
            <a href="#">Menu Item 2</a> 
            <ul>
               <li>
                  <a href="#">Menu Item 2.1</a> 
                  <ul>
                     <li><a href="#">Menu Item 2.1.1</a></li>
                     <li><a href="#">Menu Item 2.1.2</a></li>
                  </ul>
               </li>
               <li>
                  <a href="#">Menu Item 2.2</a> 
                  <ul>
                     <li><a href="#">Menu Item 2.2.1</a></li>
                     <li><a href="#">Menu Item 2.2.2</a></li>
                  </ul>
               </li>
            </ul>
         </li>
         <li>
            <a href="#">Menu Item 3</a> 
            <ul>
               <li><a href="#">Menu Item 3.1</a></li>
               <li><a href="#">Menu Item 3.1</a></li>
            </ul>
         </li>
      </ul>
   </section>
</body>
```

И така... Преди да започнем със съществената част, трябва да спомена, че за текста в нашето меню ще използваме един готин **минималистичен шрифт**, наречен **Existence Light**. Може да го намерите тук -> [LINK](http://www.dafont.com/existence.font).

След като се сдобиете с шрифта го запазете в отделна папка от основната. Сега създаваме CSS файл с примерно име **`style.css`** в отделна папка от основната. Най-горе си включваме нашият нов шрифт:

``` css
@font-face {
     font-family: ExistenceLight;
     src: url('../fonts/Existence-Light.otf');
}
```

На мястото на текста в **url()** пишем пътя до шрифта.

``` css
.navigation {
     font-family: ExistenceLight, serif;
     background: #333;
     border-bottom: 5px solid #27d819;
     font-size: 1.3em;
}
```

След това задаваме общите настройки за контейнера. Използваме вече добавения шрифт, тъмно сив фон, светло зелена рамка с големина 5 пиксела. Харесваме си големина на шрифта... добре е да я задаваме в емове (em).

``` css
.navigation ul, .navigation li {
     list-style: none;
     margin: 0px;
     padding: 0px;
}
 .navigation ul {
     text-transform: uppercase;
}
 .navigation .menu {
     display: inline-block;
}
```

Време е да премахнем ненужните неща. С **`"list-style: none"`** премахваме булетите пред елементите на листа. След това изчистваме всички ненужни margin-и и padding-и. Тъй като искаме буквите от нашето меню да са главни, използваме **`"text-transform: uppercase"`** и с **`"display: inline-block"`** подреждаме всички елементи на менюто на един ред. Да, знам че стана голяма каша, но не се безпокойте!

``` css
.navigation ul ul {
     border-top: 5px solid #27d819;
     min-width: 105%;
     visibility: hidden;
     position: absolute;
     top: 100%;
     bottom: 0px;
     left: 0px;
}
```

С **`"visibility: hidden"`** скриваме съб-менютата. Добавяме им (**`"border-top: 5px solid #27d819"`**) зелената рамка, отгоре, за да може по-късно когато направим ефектите при преминаваме с мишката (hover) да не изглежда сякаш се застъпват. Има и по-хитри начини, но този също върши работа :D. Задаваме им абсолютна позиция, за да не изместват останалите съб-менюта и им задаваме минимална дължина **105%**.

``` css
.navigation ul li:hover {
     position: relative;
}
 .navigation ul li:hover > a {
     background: #27d819;
}
 .navigation ul li:hover > ul {
     visibility: visible;
}
```
Задаваме на съб-меню елементите релативна позиция, за да не ни бягат. След това слагаме зеления цвят върху линковете от нашето меню -> **`"li:hover > a"`** означава, че при преминаване с мишката върху li елемент се прилага описания ефект върху всички преки a наследници (child) на li елемента. По същия начин показваме скритите елементи от менюто.

``` css
.navigation ul ul a {
     padding: 16px 20px;
     line-height: 150%;
}
 .navigation ul ul ul {
     border-top: 0px;
     left: auto;
     right: -105.5%;
     top: 0px;
}
```

С първия ред настройваме отстъпите на текста в линковете от контейнера им. Задаваме височина на текстовия ред да бъде 150%, за да може линкът да заема целия li елемент. След това за всяко съб-съб меню премахваме рамката зададена по-горе. Настройваме наместването в ляво да става автоматично, а това в дясно на -105.5%. Защо -105.5%? Защото по-горе вече бяхме задали всяко съб-меню да е широко поне 105.5%. Сега вече съб-съб менютата трябва да са **залепени за родителите си**.

``` css
.menu a {
     background: #333;
     color: #e5e5e5;
     display: block;
     text-decoration: none;
     padding: 0px 25px;
}
 .menu > a {
     line-height: 50px;
}
```

Дойде ред да издокараме вида на линковете.  Задаваме им сивият цвят на менюто. Клонящ към бяло (e5e5e5) цвят на буквите. Премахваме подчертавките (**`"text-decoration: none"`**). Слагаме 25px разстояние между всяко меню и правим линковете блокови елементи, за да не се наслагват един в друг. С последния ред правим текстовия ред на главното меню да бъде 50px, отново по същата ширина, както по-горе.

И отново демо -> [LINK](http://jsfiddle.net/dkalinkov93/TFUFG/20).

Надявам се урока да ви е помогнал и най-вече харесал. :)
