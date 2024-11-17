# Description
• Allows you to conveniently work with multi-touch in Solar2D

• Позволяет удобно работать с мульти-тачем в Solar2D

# ENG
The `onScreenTouches.lua` file can be placed anywhere in your project. When imported using require, it returns a table.

```lua
local ost = require("onScreenTouches")
```


The returned table provides two methods:

• `getTouches`

• `clearTouches`

• `delete`



__Method getTouches:__
returns a table containing the current touches.

__Method clearTouches:__
clears the current touches table and creates a new empty table.

__Method delete:__
removes all listeners.
Necessary if you don’t plan to monitor multi-touch anymore


Example Usage:
```lua
local ost = require("onScreenTouches")

local touches = ost.getTouches()

print(touches == ost.getTouches()) -- true

ost.clearTouches()

print(touches == ost.getTouches()) -- false
```


The table obtained from `ost.getTouches()` is an array.
Each element of the array contains a `numID` (touch identifier) and the same data as the event table in the touch listener.


Example structure of an array element:
```lua
{
    {
        numID = 83,
        event = "began",
        x = 130,
        y = 230,
        -- ... other event data --
    }
}
```



# RU
Файл `onScreenTouches.lua` можно разместить в любом месте вашего проекта. При подключении через require он возвращает таблицу.

```lua
local ost = require("onScreenTouches")
```


В возвращаемой таблице доступны два метода:

• `getTouches`

• `clearTouches`

• `delete`



__Метод getTouches:__
возвращает таблицу с текущими касаниями.

__Метод clearTouches:__
очищает текущую таблицу касаний, создавая новую пустую таблицу.

__Метод delete:__
удаляет все слушатели.
Нужно если не планируете больше следить за мультитачем


Пример использования:
```lua
local ost = require("onScreenTouches")

local touches = ost.getTouches()

print(touches == ost.getTouches()) -- true

ost.clearTouches()

print(touches == ost.getTouches()) -- false
```


Получаемая из `ost.getTouches()` таблица является массивом.
Элементы массива содержат `numID` (номер нажатия) и ту же информацию, что и таблица события в слушателе touch.

Пример структуры элемента массива:
```lua
{
    {
        numID = 83,
        event = "began",
        x = 130,
        y = 230,
        -- ... другие данные события --
    }
}
```
